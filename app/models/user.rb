class User < ApplicationRecord
  has_secure_password

  validates_length_of :password, minimum: 6
  validates_presence_of :email
  validates_confirmation_of :email, message: I18n.t('errors.messages.confirmation')
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_uniqueness_of :email
end
