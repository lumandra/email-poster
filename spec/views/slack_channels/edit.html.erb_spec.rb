require 'rails_helper'

RSpec.describe "slack_channels/edit", type: :view do
  before(:each) do
    @slack_channel = assign(:slack_channel, SlackChannel.create!())
  end

  it "renders the edit slack_channel form" do
    render

    assert_select "form[action=?][method=?]", slack_channel_path(@slack_channel), "post" do
    end
  end
end
