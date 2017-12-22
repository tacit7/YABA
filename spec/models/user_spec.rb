require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a username' do
      user.username = nil
      expect(user).to_not be_valid
    end

    it 'is not valid with a username less than 3 characters' do
      user.username = 'aa'
      expect(user).to_not be_valid
    end

    it 'is not valid with a username more than 25 characters' do
      user.username = 'a' * 26
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid with an invalid email' do
      user.email = 'invalid_email'
      expect(user).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      create(:user, email: user.email)
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end
  end

  describe 'callbacks' do
    it 'downcases email before saving' do
      user.email = 'SAMPLE@EXAMPLE.COM'
      user.save
      expect(user.reload.email).to eq('sample@example.com')
    end
  end
end
