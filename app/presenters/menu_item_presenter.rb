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

  def description
    content_tag :p, menu_item.description
  end

  def panel_body_image
    if @template.action_name == 'index'
      image_tag menu_item.image.url(:medium)
    end
  end 
  


  private
  
  def menu_item
    @object
  end
end