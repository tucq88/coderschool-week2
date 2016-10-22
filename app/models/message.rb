class Message < ApplicationRecord
  validates :body, presence: true

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end
