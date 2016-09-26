require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  describe "GET #index" do
    it "get array of reports" do
      create_user_and_reports

      process :index, method: :get

      expect(response.status).to eq 200
      expect(controller.instance_values['reports'].first).to eq @report
    end
  end

  describe "GET #show" do
    it "assigns the requested report to @report" do
      create_user_and_reports

      get :show, params: { id: @report }
      expect(response.status).to eq 200
      expect(controller.instance_values['reports'][:id]).to eq @report.id
    end
  end

  describe "GET #new" do
    it "create a new report object" do
      user = FactoryGirl.create(:user)
      sign_in(user)

      process :new, method: :get
      expect(response.status).to eq 200
      expect(controller.instance_values['report'].inspect).to eq(Report.new.inspect)
    end
  end

  describe "POST #create" do
    it "create and save new report" do
      user = FactoryGirl.create(:user)
      sign_in(user)

      post :create, params: { report: { title: 'Title', email_to_prefix: 'test_create@test.com' } }
      id = controller.instance_values['report'][:id]

      expect(controller.instance_values['report']).to eq(Report.find(id))
      expect(response.body).to redirect_to(report_path(id))
    end
  end

  describe "PUT #update" do
    it "update report title" do
      create_user_and_reports

      put :update, params: { id: @report, report: { title: 'Megatitle' } }

      expect(controller.instance_values['report'][:title]).to eq('Megatitle')
    end
  end

  describe "DELETE #destroy" do
    it "delete report" do
      create_user_and_reports
      counter = Report.count

      put :destroy, params: { id: @report }

      expect(counter - 1).to eq(Report.count)
    end
  end
end


