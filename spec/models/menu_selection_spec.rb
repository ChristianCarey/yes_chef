require 'rails_helper'

RSpec.describe MenuSelection, type: :model do

  describe 'associations' do

    it { should belong_to(:menu) }

    it { should belong_to(:menu_item) }

  end

end
