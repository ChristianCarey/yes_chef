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
      content_tag :span, category.name, class: "label label-warning category-label"
    end.join.html_safe
  end
  
  


  private
  
  def menu_item
    @object
  end
end