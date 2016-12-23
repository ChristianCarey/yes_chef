class MenuItemsController < ApplicationController

  before_action :find_item, except: [:index, :new, :create]
  before_action :current_chef, except: [:index, :show, :new, :create]

  def index
    if current_user.role == 'chef'
      @menu_items = current_user.menu_items
    else
      redirect_to current_user
    end
  end

  def show
  end

  def new
    @menu_item = current_user.menu_items.build
  end

  def create
    add_user_id_to_ingredients
    @menu_item = current_user.menu_items.build(menu_item_params)
    if @menu_item.save
      flash[:success] = "New Menu Item Created!"
      redirect_to @menu_item
    else
      flash.now[:danger] = ["Something went wrong.."]
      @menu_item.errors.full_messages.each do |error|
        flash.now[:danger] << error
      end
      render :new
    end
  end

  def edit
  end

  def update
    add_user_id_to_ingredients
    if @menu_item.update(menu_item_params)
      flash[:success] = "Menu Item: #{@menu_item.name} updated!"
      redirect_to @menu_item
    else
      flash.now[:danger] = ["Something went wrong.."]
      @menu_item.errors.full_messages.each do |error|
        flash.now[:danger] << error
      end
      render :edit
    end
  end

  def destroy
    MenuItem.where(id: @menu_item.id).destroy_all
    flash[:info] = "Menu Item Destroyed"
    redirect_to menu_items_path
  end

  private
    def menu_item_params
      params.require(:menu_item).permit(:name, :description, :price, :image,
                  { ingredients_attributes: [:user_id, :name] },
                  { categories_attributes: [:name] }, category_ids:[], ingredient_ids: [])
    end

    def find_item
      @menu_item = MenuItem.find_by(id: params[:id])
    end

    def current_chef
      if current_user != @menu_item.chef
        redirect_to current_user
      end
    end

    def add_user_id_to_ingredients
      if params[:menu_item][:ingredients_attributes]["0"] &&
         !params[:menu_item][:ingredients_attributes]["0"][:name].empty?
        params[:menu_item][:ingredients_attributes]["0"][:user_id] = current_user.id
      end
    end

end
