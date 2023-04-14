require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /' do
    it 'returns a success response' do
      get root_path
      expect(response).to be_successful
    end
  end
end
