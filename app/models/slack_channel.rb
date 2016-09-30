class SlackChannel < ApplicationRecord
  BOT_NAME = 'EmailPoster.co'

  belongs_to :report, optional: true
end
