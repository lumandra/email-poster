class Email < ApplicationRecord
  belongs_to :user
  mount_uploaders :attachments, BaseUploader
end
