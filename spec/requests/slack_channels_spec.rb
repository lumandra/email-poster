require 'rails_helper'

RSpec.describe "SlackChannels", type: :request do
  describe "GET /slack_channels" do
    it "works! (now write some real specs)" do
      get slack_channels_path
      expect(response).to have_http_status(200)
    end
  end
end
