module OrdersHelper

  def stringify_date(date)
    date.strftime("%A, %b %e")
  end

  def render_menu_item_img(menu_item)
    if menu_item.image.exists?
      "#{image_tag menu_item.image.url(:thumb)} ".html_safe
    end
  end
end
