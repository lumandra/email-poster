class Email < ApplicationRecord
  belongs_to :report, optional: true
  has_many :slack_channels, through: :report

  enum status: [ :success, :error ]
  serialize :img_urls, Array

  mount_uploaders :attachments, BaseUploader

  after_create :filestack_save
  after_commit :slack_channel, on: [:create]

  def status_formated
    state = self.status
    state.respond_to?(:to_str) ? state : state == 0 ? 'success' : 'error'
  end

  private

  def filestack_save
    FileStackIntegration.new(self).save_img
  end

  def slack_channel
    SlackChannelIntegration.new(self).create_notify
  end

end
