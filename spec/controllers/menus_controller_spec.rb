require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  # include Devise::Test::ControllerHelpers

  let(:user){ create(:user, :chef) }

  describe "POST #create" do
    context 'authenticated chef' do
      before do
        sign_in(user)
        process :create, params: { menu: attributes_for(:menu) }
      end

      it "creates a menu" do
        expect(Menu.count).to eq(1)
      end

      it "redirects to the menu's show page" do
        expect(response).to redirect_to(menu_path(Menu.last))
      end
    end

    context 'unauthenticated' do

      it "creates a menu" do
        expect{ process :create, params: { menu: attributes_for(:menu) } }.to_not change(Menu, :count)
      end

      it "redisplays the new page" do
        assert_response :success
      end
    end
  end
end
