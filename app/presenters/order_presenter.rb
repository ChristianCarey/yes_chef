class OrderPresenter < BasePresenter

  def completion_date
    stringify_date(order.menu.completion_date)
  end

  def completion_date_or_delivered
    if order.menu.completion_date > Date.today
      completion_date
    else
      content_tag :p, "Fulfilled #{completion_date}!", class: 'delivered-text'
    end
  end

  def order_total
    format_currency(order.total)
  end

  def order_table_header
    columns = %w(Item Unit\ Price Quantity Total)
    content_tag :thead do
     content_tag :tr do
      columns.collect { |column|  concat content_tag(:th,column) }.join().html_safe
      end
    end
  end

  def order_table_items
    order.order_items.collect do |item|
      content_tag :tr do |row|
        content_tag :td do |cell|
          content_tag(:strong, item.menu_item.name)
          .concat(content_tag :p, item.menu_item.description)
        end
        .concat(content_tag :td, item.menu_item.price)
        .concat(content_tag :td, item.quantity)
        .concat(content_tag(:td, format_currency(item.menu_item_total_price)))
      end
    end.join.html_safe
  end

  def table_lead_in
    ready_on_tagline
    .concat table_heading
  end

  def ready_on_tagline
    content_tag :p do
      content_tag :strong do
        if chef?
          "The delivery/pick-up date of this order is: "
        else
          "Your order will be ready on: "
        end
      end
      .concat(completion_date)
    end
  end

  def table_heading
    content_tag :h3 do 
      if order.menu.completion_date < Date.today
        "Items ordered:"  
      elsif chef?
        "The customer has requested:"
      else
        "What you'll be receiving:"
      end
    end
  end

  private

    def order
      @object
    end
end
