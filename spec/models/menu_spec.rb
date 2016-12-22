require 'rails_helper'

RSpec.describe Menu, type: :model do

  describe 'validations' do

    it { should validate_presence_of(:order_deadline)}

    it { should validate_presence_of(:completion_date)}

    it "should not allow dates in the past" do
      menu = build(:menu, completion_date: 1.day.ago)
      expect(menu).to_not be_valid
    end
  end

  describe 'associations' do

    it { should belong_to(:chef) }

    it { should have_many(:menu_selections) }

    it { should have_many(:menu_items) }

  end

end
