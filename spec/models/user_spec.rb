require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  describe 'validations' do
    subject { FactoryBot.build(:user) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value('email@example.com').for(:email) }
    it { is_expected.not_to allow_value('email').for(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:messages) }
  end
end
