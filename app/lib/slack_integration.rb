require "net/http"
require "uri"
require 'open-uri'

class SlackIntegration

  def determine_webhook report_id, code
    uri = URI("https://slack.com/api/oauth.access?client_id=#{TestApp::Application.config.slack_client_id}&client_secret=#{TestApp::Application.config.slack_client_secret}&code=#{code}")
    response = Net::HTTP.get(uri)
    response_data = JSON.parse(response)

    message = "Hello! Now I'm connected to this channel! :smirk:"
    send_message(response_data['incoming_webhook']['url'], message)
    save_slack_channel(response_data, report_id)
  end

  def send_message webhook, message
    notifier = Slack::Notifier.new("#{webhook}", username: "#{SlackChannel::BOT_NAME}")
    notifier.ping message
  end

  def save_slack_channel response_data, report_id
    SlackChannel.create(webhook_url: response_data['incoming_webhook']['url'], report_id: report_id)
  end

end