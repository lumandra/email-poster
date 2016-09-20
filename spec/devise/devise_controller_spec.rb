require 'rails_helper'

RSpec.describe 'Login user', :type => :request do
  describe "anonymous user" do
    it "blocks unauthenticated access" do
      get '/user/edit'
      expect(response).to redirect_to(new_user_session_path)
    end

    it "allows authenticated access" do
      user = FactoryGirl.create(:user)
      login_as user
      get '/user/edit'
      expect(response.status).to eq(200)
    end
  end
end
