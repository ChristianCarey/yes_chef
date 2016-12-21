require 'rails_helper'

describe MenuItem, type: :model do
  let(:menu_item) { build(:menu_item) }

  describe 'associations' do

    it { should have_many(:menus) }

  end

  describe 'validation' do

    it 'should validate name' do

    end

    it 'should validate description'

    it 'should have a user'

    it 'should validate unique names in the scope of its user'

  end

end
