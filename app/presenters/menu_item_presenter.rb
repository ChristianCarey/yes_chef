class MenuItemPresenter < BasePresenter

  def ingredients
    result = "Ingredients: "
    result += menu_item.ingredients.map do |ingredient|
      ingredient.name
    end.join(", ")
    content_tag :p, result, class: "ingredients-list"
  end

  def categories
    # TODO this could be a problem if the chef tags with tons of categories
    menu_item.categories.map do |category|
      content_tag :span, category.name, class: "label label-warning category-label pull-right"
    end.join.html_safe
  end

  def menu_item_orders_count
    if current_chef?(menu_item)
      content_tag :h5, "You have sold #{pluralize(menu_item.order_items_count, "serving")} of this item."
    end
  end

  private

  def menu_item
    @object
  end
end
