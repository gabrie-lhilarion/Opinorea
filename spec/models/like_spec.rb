require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = build(:user)
    @opinion = build(:opinion, user: @user)
    @like = build(:like, user: @user, opinion: @opinion )
  end

  it "is a valid factory" do
    expect(@like).to be_valid
  end

  describe "Active Record Association" do 
    it "Belongs to user" do 
      expect(Like.reflect_on_association(:user).macro).to be(:belongs_to)
    end

    it "Belongs to opinion" do 
      expect(Like.reflect_on_association(:opinion).macro).to be(:belongs_to)
    end
  end

end
