class Profile < ApplicationRecord
  belongs_to :user

  before_save :fix_names

  validates_presence_of :first_name, :last_name

  def name
    "#{first_name} #{last_name}"
  end

  private
    def fix_names
      first_name.capitalize! if first_name
      last_name.capitalize! if last_name
    end
end
