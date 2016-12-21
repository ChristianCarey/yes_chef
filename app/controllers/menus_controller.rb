class MenusController < ApplicationController

  before_action :find_menu, except: [:index, :new, :create]

  def index
    @menus = current_user.menus.all
    # list of all current/previous menus
      # past
      # current
  end

  def show
    # details of time period
    # menu items
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(whitelist)
    @menu.menu_item_ids = params[:menu_item_ids]
    if @menu.save
      flash[:success] = "Menu and items saved."
      @menu
    else
      flash.now[:danger] = "Could not save menu."
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def find_menu
      @menu = Menu.find_by_id(params[:id])
    end

    def whitelist
      params.require(:menu).permit(:start_date, :end_date)
    end

end
