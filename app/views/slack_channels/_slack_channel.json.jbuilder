json.extract! slack_channel, :id, :created_at, :updated_at
json.url slack_channel_url(slack_channel, format: :json)