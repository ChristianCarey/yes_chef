class MenuItemPresenter < BasePresenter

  def ingredients
    menu_item.ingredients.map do |ingredient|
      content_tag :li, ingredient.name
    end.join.html_safe
  end

  def categories
    # TODO this could be a problem if the chef tags with tons of categories
    menu_item.categories.map do |category|
      content_tag :span, category.name, class: "label label-warning category-label"
    end.join.html_safe
  end
  
  


  private
  
  def menu_item
    @object
  end
end