class Room < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  has_many :messages, -> { order(created_at: :desc) }, dependent: :destroy
  belongs_to :user

  after_create do
    # broadcast_replace_to(
    #   'room',
    #   target: 'room',
    #   partial: 'rooms/form',
    #   locals: { room: Room.new }
    # )

    broadcast_prepend_to(
      'rooms',
      target: 'rooms',
      partial: 'rooms/room',
      locals: { room: self }
    )
  end
end
