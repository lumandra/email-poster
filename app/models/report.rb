class Report < ApplicationRecord
  EMAILTO_POSTFIX = '@inbound.emailposter.co'

  attr_writer :email_to_prefix

  before_validation :ensure_email_to

  belongs_to :user, optional: true
  has_many :emails

  validates :title, presence: true
  validates :email_to,
            format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Incorrectly (.. @ ... com)'},
            uniqueness: {message: 'the email address already exists'}

  def email_to_prefix
    @email_to_prefix ||= email_to.split('@')[0] rescue nil
  end

  private

  def ensure_email_to
    if email_to_prefix.blank?
      self.email_to = title.downcase.gsub(/\s+/, '_') + EMAILTO_POSTFIX
    else
      self.email_to = email_to_prefix.split('@')[0] + EMAILTO_POSTFIX
    end
  end
end