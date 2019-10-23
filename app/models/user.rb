# warn_indent: true
# frozen_string_literal: true

# User class used for authentication purposes.
class User < ApplicationRecord
  attr_accessor :password
  before_save :encrypt_password

  validates :password, confirmation: true, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: true }

  def self.authenticate(username, password)
    user = find_by_username(username)
    password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
    return unless user && user.password_hash == password_hash

    user
  end

  def encrypt_password
    return unless password.present?

    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
