require 'rails_helper'

RSpec.describe MessagesController, type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:room) { create(:room) }
    let(:valid_attributes) { { content: 'Test message', user_id: user.id, room_id: room.id } }
    let(:invalid_attributes) { { content: '', room_id: room.id } }

    context 'with valid params' do
      it 'creates a new message' do
        expect do
          post messages_path, params: { message: valid_attributes }
        end.to change(Message, :count).by(1)
      end

      it 'redirects to the room' do
        post messages_path, params: { message: valid_attributes }
        expect(response).to redirect_to(root_path(room_id: room))
      end
    end

    context 'with invalid params' do
      it 'does not create a new message' do
        expect do
          post messages_path, params: { message: invalid_attributes }
        end.not_to change(Message, :count)
      end

      it 'renders the new template' do
        post messages_path, params: { message: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
end
