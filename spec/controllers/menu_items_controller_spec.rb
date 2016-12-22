require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do

  describe "GET #index" do
    context 'authenticated chef' do
      let(:chef){ create(:chef, :chef) }

      before do
        sign_in(chef)
      end
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

end
