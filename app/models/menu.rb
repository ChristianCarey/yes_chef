class Menu < ApplicationRecord
  belongs_to :chef, class_name: 'User', foreign_key: :user_id

  has_many :menu_selections, inverse_of: :menu, dependent: :destroy
  has_many :menu_items, through: :menu_selections
  has_many :orders, dependent: :nullify

  accepts_nested_attributes_for :menu_selections

  validates_presence_of :order_deadline, :completion_date

  validates_uniqueness_of :completion_date, scope: :chef

  validate :correct_dates
  validate :presence_of_menu_selections

  private
    def correct_dates
      if order_deadline && completion_date
        correct_deadline
        in_the_past(completion_date, :completion_date)
        in_the_past(order_deadline, :order_deadline)
      end
    end

    def presence_of_menu_selections
      if self.menu_selections.empty?
        errors.add(:menu_item_ids, :invalid, message: "Must select at least one item for this menu.")
      end
    end

    def correct_deadline
      if order_deadline > completion_date
        errors.add(:order_deadline, :invalid, message: "Order Deadline cannot be after completion_date")
      end
    end

    def in_the_past(date, arg)
      if date < Date.today
        errors.add(arg, :invalid, message: "#{arg.to_s.humanize} cannot be before today")
      end
    end

end
