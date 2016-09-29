class SlackChannel < ApplicationRecord
  belongs_to :report, optional: true
end
