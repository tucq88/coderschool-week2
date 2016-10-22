class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  has_secure_password

  def sent_messages

  end

  def received_messages

  end
end
