require "rails_helper"

RSpec.describe SlackChannelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/reports/1/slack_channels").to route_to("slack_channels#index", report_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/reports/1/slack_channels/new").to route_to("slack_channels#new", report_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/reports/1/slack_channels/1").to route_to("slack_channels#show", :id => "1", report_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/reports/1/slack_channels/1/edit").to route_to("slack_channels#edit", :id => "1", report_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/reports/1/slack_channels").to route_to("slack_channels#create", report_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/reports/1/slack_channels/1").to route_to("slack_channels#update", :id => "1", report_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/reports/1/slack_channels/1").to route_to("slack_channels#update", :id => "1", report_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/reports/1/slack_channels/1").to route_to("slack_channels#destroy", :id => "1", report_id: '1')
    end

  end
end
