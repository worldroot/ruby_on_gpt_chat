class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :replier, class_name: 'User', optional: true
  validates :user, presence: true
  validates :content, presence: true

  after_create do
    broadcast_replace_to(
      'message',
      target: "message_#{room.id}",
      partial: 'messages/form',
      locals: { message: Message.new }
    )

    broadcast_prepend_to(
      'messages',
      target: "messages_#{room.id}",
      partial: 'messages/message',
      locals: { message: self }
    )
  end
end
