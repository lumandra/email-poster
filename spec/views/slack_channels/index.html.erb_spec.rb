require 'rails_helper'

RSpec.describe "slack_channels/index", type: :view do
  before(:each) do
    assign(:slack_channels, [
      SlackChannel.create!(),
      SlackChannel.create!()
    ])
  end

  it "renders a list of slack_channels" do
    render
  end
end
