class MenuItemsController < ApplicationController

  before_action :find_item, except: [:index, :new, :create]
  before_action :current_chef, except: [:index, :show, :new, :create]

  def index
    if current_user.role == 'chef'
      @items = current_user.menu_items
    else
      redirect_to current_user
    end
  end

  def show
  end

  def new
    @item = current_user.menu_items.build
  end

  def create
    @item = current_user.menu_items.build(menu_item_params)
    if @item.save
      flash[:success] = "New Menu Item Created!"
      redirect_to @item
    else
      flash.now[:danger] = ["Something went wrong.."]
      @item..errors.full_messages.each do |error|
        flash.now[:danger] << error
      end
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(menu_item_params)
      flash[:success] = "Menu Item: #{@item.name} updated!"
      redirect_to @item
    else
      flash.now[:danger] = ["Something went wrong.."]
      @item..errors.full_messages.each do |error|
        flash.now[:danger] << error
      end
      render :edit
    end
  end

  def destroy
    MenuItem.where(id: @item.id).destroy_all
    flash[:info] = "Menu Item Destroyed"
    redirect_to menu_items_path
  end

  private
    def menu_item_params
      params.require(:menu_item).permit(:name, :description)
    end

    def find_item
      @item = MenuItem.find_by(id: params[:id])
    end

    def current_chef
      if current_user != @item.chef
        redirect_to current_user
      end
    end

    def current_chef?
      current_user == @item.chef
    end
    helper_method :current_chef?

end
