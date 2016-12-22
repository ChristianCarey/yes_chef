class MenuPresenter < BasePresenter

  def start_date
    menu.start_date.strftime("%A, %b %e")
  end

  def end_date
    menu.end_date.strftime("%A, %b %e")
  end

  def date_range
    "#{start_date} to #{end_date}"
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
