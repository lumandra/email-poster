class SlackIntegration::Channel < SlackIntegration

  def initialize email
    @email = email
  end

  def create_notify
    images = @email.img_urls.map{|u| u['url']}.join(', ')
    @email.slack_channels.each do |channel|
      if channel.slack_message_text == nil || channel.slack_message_text == ''
        message = "#{images}"
      else
        message = "#{images}, Message: #{channel.slack_message_text}"
      end
      send_message(channel.webhook_url, message)
    end
  end

end
