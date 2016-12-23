class CategoriesController < ApplicationController

  def index
    @categories = []

    mis = current_user.menu_items
    mis.each do |mi|
      CategoriesMenuItem.where('menu_item_id = ?', mi.id).find_each do |r|
        @categories << r.category unless @categories.include?(r.category)
      end
    end
  end

  def show
    @category = Category.find_by(id: params[:id])
    categories = CategoriesMenuItem.where('category_id = ?', @category.id)
    @menu_items = []
    categories.map do |cat|
      @menu_items << cat.menu_item if cat.menu_item.user_id == current_user.id
    end
  end

end
