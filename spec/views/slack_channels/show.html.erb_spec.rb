require 'rails_helper'

RSpec.describe "slack_channels/show", type: :view do
  before(:each) do
    @slack_channel = assign(:slack_channel, SlackChannel.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
