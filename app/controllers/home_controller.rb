class HomeController < ApplicationController
  helper_method :current_room?, :current_room
  def index
    @rooms = Room.order(created_at: :desc)
  end

  def current_room?
    !current_room.nil?
  end

  def current_room
    @current_room ||= Room.where(id: params[:room_id]).first
  end
end
