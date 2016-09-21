class Email < ApplicationRecord
  belongs_to :report, optional: true
  enum status: [ :success, :error ]

  mount_uploaders :attachments, BaseUploader

  def status_formated
    state = self.status
    state.respond_to?(:to_str) ? state : state == 0 ? 'success' : 'error'
  end

  end
