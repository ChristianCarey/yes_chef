class Order < ApplicationRecord
  belongs_to :menu, counter_cache: true
  belongs_to :customer, class_name: 'User', foreign_key: :customer_id

  has_many :order_items, inverse_of: :order
  has_many :menu_items, through: :order_items

  default_scope { includes(:menu, :customer, :menu_items, :order_items) }

  accepts_nested_attributes_for :order_items, reject_if: proc { |attributes| attributes['quantity'].blank? || attributes['menu_item_id'].blank?}

  validate :presence_of_order_selections

  def chef
    menu.chef
  end

  def total
    order_items.sum('sale_price_cents * quantity')
  end

<<<<<<< Updated upstream
=======
  def total_items
    order_items.inject(0) {|sum, item| sum + (item.quantity)}
  end

  def self.send_receipt(order_id)
    OrderMailer.receipt(find(order_id)).deliver_later
    OrderMailer.order_to_chef(find(order_id)).deliver_later
  end

  def presence_of_order_selections
    if self.menu_items.empty?
      errors.add(:menu_items, :invalid, message: "Must select at least one item for this order.")
    end
  end

>>>>>>> Stashed changes
end
