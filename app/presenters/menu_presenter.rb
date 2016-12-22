class MenuPresenter < BasePresenter

  def order_deadline
    menu.order_deadline.strftime("%A, %b %e")
  end

  def completion_date
    menu.completion_date.strftime("%A, %b %e")
  end

  def date_range
    "#{order_deadline} to #{completion_date}"
  end

  def menu_items
    result = ""
    menu.menu_items.each do |menu_item|
      result += content_tag :li, link_to(menu_item.name, menu_item)
    end
    result.html_safe
  end

  private

  def menu
    @object
  end
end
