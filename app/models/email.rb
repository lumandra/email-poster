class Email < ApplicationRecord
  belongs_to :report, optional: true

  enum status: [ :success, :error ]
  serialize :img_urls, Array

  mount_uploaders :attachments, BaseUploader

  after_create :filestack_save

  def status_formated
    state = self.status
    state.respond_to?(:to_str) ? state : state == 0 ? 'success' : 'error'
  end

  private

  def filestack_save
    FileStackIntegration.new(self).save_img
  end

end
