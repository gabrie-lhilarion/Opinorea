require 'rails_helper'

RSpec.describe Reply, type: :model do
  before do
    @user = create(:user)
    @opinion = build(:opinion, user: @user)
    @reply = build(:reply, content: "This is nice opinion", user: @user, opinion: @opinion)
  end

  it "is a valid factory" do
    expect(@reply).to be_valid
  end

  describe "Active Record Association" do
    it "Belongs to user" do
      expect(Reply.reflect_on_association(:user).macro).to be(:belongs_to)
    end

    it "Belongs to opinion" do
      expect(Reply.reflect_on_association(:opinion).macro).to be(:belongs_to)
    end
  end

  describe "Active Record Validation" do
    it "is invalid without a content" do
      reply = build(:reply, content: nil, user: @user, opinion: @opinion)
      expect(reply).not_to be_valid
    end

    it "is invalid with content more than 50 characters" do
      reply = build(:reply, content: "This content here is more than fifthy characters very long, do you see or have you notide", user: @user, opinion: @opinion)
      expect(reply).not_to be_valid
    end
  end
end
