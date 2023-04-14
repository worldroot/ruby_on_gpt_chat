class Message < ApplicationRecord
  default_scope -> { order(created_at: :asc) }
  belongs_to :room
  belongs_to :user, optional: true
  belongs_to :replier, class_name: 'User', optional: true
  validates :content, presence: true

  after_create do
    broadcast_update_to(
      'message',
      target: "message_#{room.id}",
      partial: 'messages/form',
      locals: { message: Message.new, room_id: room.id }
    )

    broadcast_append_to(
      'messages',
      target: "messages_#{room.id}",
      partial: 'messages/message',
      locals: { message: self }
    )
  end

  def create_by_owner_or_replier(user)
    room_to_save = room || Room.find(room_id)
    if room_to_save.user_id == user.id
      self.user_id = user.id
    else
      self.replier_id = user.id
    end
    save
  end
end
