require 'rails_helper'

RSpec.describe 'cancan ability', :type => :request do
  describe 'user ability' do

    before (:each) do
      first_user = FactoryGirl.create(:user)
      @first_report = FactoryGirl.create(:report, user_id: first_user.id)

      second_user = FactoryGirl.create(:user)
      @second_report = FactoryGirl.create(:report, user_id: second_user.id)

      login_as second_user
    end

    it 'redirect with exeption' do
      get "/reports/#{@first_report.id}"
      expect(response).to redirect_to(reports_path)
    end

    it 'allows correct page' do
      get "/reports/#{@second_report.id}"
      expect(response.status).to eq(200)
    end
  end
end