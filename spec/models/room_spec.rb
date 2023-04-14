require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    # it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:messages).dependent(:destroy) }
  end

  describe 'factory' do
    let(:room) { FactoryBot.build(:room) }

    it 'has a valid factory' do
      expect(room).to be_valid
    end
  end

  describe 'database' do
    let!(:room) { FactoryBot.create(:room) }

    it 'can be saved to database' do
      expect(room).to be_valid
    end
  end
end
