require 'rails_helper'

RSpec.describe MenuItem, type: :model do

  describe 'associations' do

    it { should have_many(:menus) }

  end
  
end
