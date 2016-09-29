class SlackChannelIntegration

  def initialize email
    @email = email
  end

  def create_notify
    images = @email.img_urls.map{|u| u['url']}.join(', ')
    @email.slack_channels.each do |channel|
      notifier = Slack::Notifier.new("#{channel.webhook_url}", channel: "##{channel.channel}", username: "#{channel.username}")
      
      notifier.ping "#{images}"
    end
  end

end
