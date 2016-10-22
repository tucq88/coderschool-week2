class Message < ApplicationRecord
  validates :body, presence: true

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  def is_read
    self.read_at.present? ? true : false
  end

  def read_info
    self.read_at.present? ? self.read_at.to_formatted_s(:long_ordinal) : "Unread"
  end
end
