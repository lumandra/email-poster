class Email < ApplicationRecord
  belongs_to :report, optional: true
  enum status: [ :success, :error ]

  mount_uploaders :attachments, BaseUploader
end
