require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user)    { create(:user) }
  let(:article) { build(:article, user: user) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(article).to be_valid
    end

    it 'is not valid without a title' do
      article.title = nil
      expect(article).to_not be_valid
    end

    it 'is not valid with a title that is too short' do
      article.title = 'Shrt'
      expect(article).to_not be_valid
    end

    it 'is not valid with a title that is too long' do
      article.title = 'A' * 101
      expect(article).to_not be_valid
    end

    it 'is not valid without a description' do
      article.description = nil
      expect(article).to_not be_valid
    end

    it 'is not valid with a description that is too short' do
      article.description = 'Short'
      expect(article).to_not be_valid
    end

    it 'is not valid with a description that is too long' do
      article.description = 'A' * 301
      expect(article).to_not be_valid
    end
  end

  context 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
