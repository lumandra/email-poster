require 'rails_helper'

RSpec.describe "slack_channels/new", type: :view do
  before(:each) do
    assign(:slack_channel, SlackChannel.new())
  end

  it "renders new slack_channel form" do
    render

    assert_select "form[action=?][method=?]", slack_channels_path, "post" do
    end
  end
end
