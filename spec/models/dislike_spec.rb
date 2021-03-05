require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = build(:user)
    @opinion = build(:opinion, user: @user)
    @dislike = build(:dislike, user: @user, opinion: @opinion)
  end

  it "is a valid factory" do
    expect(@dislike).to be_valid
  end

  describe "Active Record Association" do
    it "Belongs to user" do
      expect(Dislike.reflect_on_association(:user).macro).to be(:belongs_to)
    end

    it "Belongs to opinion" do
      expect(Dislike.reflect_on_association(:opinion).macro).to be(:belongs_to)
    end
  end
end
