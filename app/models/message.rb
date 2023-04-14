class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :replier, class_name: 'User', optional: true
  validates :user, presence: true
  validates :content, presence: true
end
