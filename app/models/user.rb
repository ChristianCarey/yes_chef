class User < ApplicationRecord

  attr_accessor :first_name, :last_name

  has_many :menus, dependent: :destroy
  has_many :menu_items, dependent: :destroy

  has_many :ingredients, dependent: :destroy

  has_many :placed_orders, class_name: 'Order', foreign_key: :customer_id, dependent: :nullify

  has_many :order_items, through: :placed_orders
  has_many :customers, class_name: "User", foreign_key: :chef_id

  has_one :profile, dependent: :destroy

  belongs_to :chef, class_name: "User", optional: true, foreign_key: :chef_id

  validate :correct_role

  validates_presence_of :first_name, :last_name, on: [:create]

  after_create :set_names

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def top_ten_customers
    if chef?
      customers.order(placed_orders_count: :desc).limit(10)
    end
  end

  def top_ten_menu_items
    if chef?
      menu_items.order(order_items_count: :desc).limit(10)
    end
  end

  def name
    profile.name
  end

  private
    def correct_role
      unless ["chef", "customer"].include?(role)
        errors.add(:role, :invalid, message: "Don't try to hack our system")
      end
    end

    def set_names
      self.create_profile(first_name: first_name, last_name: last_name)
    end

    def chef?
      role == "chef"
    end
end
