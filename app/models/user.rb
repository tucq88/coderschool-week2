class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  has_secure_password

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def sent_messages
    Message.where(sender: self)
  end

  def received_messages
    Message.where(recipient: self)
  end

  def recent_messages(n = 10)
    received_messages.order(created_at: :desc).limit(n)
  end

  def is_friend(id)
    Friendship.where(user_id: id, friend_id: self.id).first
  end


end
