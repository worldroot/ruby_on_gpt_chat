require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:message)).to be_valid
  end

  describe 'validations' do
    subject { FactoryBot.build(:message) }

    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:room) }
  end

  describe 'factories' do
    describe ':message' do
      let(:message) { FactoryBot.build(:message) }

      it 'is valid' do
        expect(message).to be_valid
      end
    end
  end
end
