class Email < ApplicationRecord
  belongs_to :user
  belongs_to :report

  mount_uploaders :attachments, BaseUploader
end
