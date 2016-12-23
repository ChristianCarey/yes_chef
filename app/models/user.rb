class User < ApplicationRecord

  attr_accessor :first_name, :last_name

  has_many :menus, dependent: :destroy
  has_many :menu_items, dependent: :destroy

  has_many :ingredients

  has_many :received_orders, class_name: 'Order', foreign_key: :chef_id
  has_many :placed_orders, class_name: 'Order', foreign_key: :customer_id

  has_many :order_items, through: :placed_orders
  has_many :customers, class_name: "User", foreign_key: :chef_id

  has_one :profile, dependent: :destroy

  belongs_to :chef, class_name: "User", optional: true, foreign_key: :chef_id

  validate :correct_role

  validates_presence_of :first_name, :last_name, on: [:create]

  after_create :set_names

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
    def correct_role
      unless ["chef", "customer"].include?(role)
        errors.add(:role, :invalid, message: "Don't try to hack our system")
      end
    end

    def set_names
      self.create_profile(first_name: first_name, last_name: last_name)
    end
end
