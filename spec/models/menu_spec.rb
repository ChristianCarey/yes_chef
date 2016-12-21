require 'rails_helper'

RSpec.describe Menu, type: :model do

  describe 'validations' do

    it { should validate_presence_of(:start_date)}

  end

  describe 'associations' do

    it { should belong_to(:chef) }

    it { should have_many(:menu_items) }

  end

end
