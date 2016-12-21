require 'rails_helper'

describe MenuItem, type: :model do
  let(:menu_item) { build(:menu_item) }
  let(:no_name){ build(:menu_item, name: "")}

  describe 'associations' do

    it { should have_many(:menus) }

  end

  describe 'validation' do

    it 'should validate name' do
      expect(menu_item).to be_valid
      expect(no_name).to_not be_valid
    end

    it 'should validate description'

    it 'should have a user'

    it 'should validate unique names in the scope of its user'

  end

end
