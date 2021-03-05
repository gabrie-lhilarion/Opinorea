require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a username" do
    new_user = build(:user, username: nil)
    new_user.valid?
    expect(new_user.errors[:username]).to include("can't be blank")
  end

  it "is invalid with a duplicate email" do
    new_user = create(:user, email: 'goodman@opinoria.com')
    user_with_duplicate_email = build(:user, email: 'goodman@opinoria.com')
    user_with_duplicate_email.valid?
    expect(user_with_duplicate_email).to_not be_valid
  end

  it "is invalid with a duplicate username" do
    new_user = create(:user, username: 'goodman')
    user_with_duplicate_username = build(:user, username: 'goodman')
    user_with_duplicate_username.valid?
    expect(user_with_duplicate_username).to_not be_valid
  end

  context 'ActiveRecord associations' do
    it "is invalid for inavlid associated opinion" do
      user = create(:user)
      opinion = user.opinions.build(comment: nil)
      expect(opinion).to_not be_valid
    end

    it "is valid for valid associated opinion" do
      user = create(:user)
      opinion = user.opinions.build(comment: 'This is my honest comment, you know!')
      expect(opinion).to be_valid
    end

    it 'has many opinions' do
      expect(User.reflect_on_association(:opinions).macro).to be(:has_many)
    end

    it 'has many followings' do
      expect(User.reflect_on_association(:followings).macro).to be(:has_many)
    end
  end
end
