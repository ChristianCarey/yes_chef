require 'rails_helper'

describe MenuItem, type: :model do
  let(:menu_item) { create(:menu_item) }
  let(:menu_item_name_dup) { build(:menu_item, chef: menu_item.chef, name: menu_item.name) }
  let(:menu_item_name_dup_different_chef) { build(:menu_item, name: menu_item.name) }
  let(:no_name){ build(:menu_item, name: "")}
  let(:no_description){ build(:menu_item, description: "")}
  let(:no_chef){ build(:menu_item, chef: nil)}

  describe 'associations' do

    it { should have_many(:menus) }
    it { should belong_to(:chef)}

  end

  describe 'validation' do

    it 'should validate name' do
      expect(menu_item).to be_valid
      expect(no_name).to_not be_valid
    end

    it 'should validate description' do
      expect(menu_item).to be_valid
      expect(no_description).to_not be_valid
    end

    it 'should have a chef' do
      expect(menu_item).to be_valid
      expect(no_chef).to_not be_valid
    end

    it 'should validate unique names in the scope of its chef' do
      expect(menu_item_name_dup).to_not be_valid
      expect(menu_item_name_dup_different_chef).to be_valid
    end

  end

end
