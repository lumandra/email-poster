class SlackChannelIntegration

  def initialize email
    @email = email
  end

  def create_notify
    images = @email.img_urls.map{|u| u['url']}.join(', ')
    @email.slack_channels.each do |channel|
      notifier = Slack::Notifier.new("#{channel.webhook_url}", username: "#{SlackChannel::BOT_NAME}")
      
      notifier.ping "#{images}, Message: #{channel.slack_message_text}"
    end
  end

end
