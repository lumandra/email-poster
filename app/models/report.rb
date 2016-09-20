class Report < ApplicationRecord
  EMAILTO_POSTFIX = '@inbound.emailposter.co'

  before_validation :ensure_email_to

  has_and_belongs_to_many :users
  has_many :emails

  validates :email_to, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Incorrectly (.. @ ... com)'}, uniqueness: {message: 'User with this email already exists'}

  private

  def ensure_email_to
    self.email_to = title.downcase.gsub(/\s+/, '_') + EMAILTO_POSTFIX
  end
end
