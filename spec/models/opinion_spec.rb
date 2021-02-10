require 'rails_helper'

RSpec.describe Opinion, type: :model do
  it "is a valid factory" do
    user = create(:user)
    opinion = build(:opinion, user: user)
    expect(opinion).to be_valid 
  end

  context "Active record association" do
    it "belongs to user" do 
      expect(Opinion.reflect_on_association(:user).macro).to be(:belongs_to)
    end
  end

  context "Active record validation" do 

    it "is invalid without a comment" do  
      user = create(:user)
      opinion = build(:opinion, comment: nil, user: user)
      expect(opinion).to_not be_valid 
    end

    it "is not allowed to have a comment of more than 50 characters" do  
      user = create(:user)
      opinion = build(:opinion, comment: 'This a comment and this comment has more than fifty characters', user: user)
      opinion.valid?
      expect(opinion.errors[:comment]).to include("Message can not be empty and should be less than 50 characters") 
    end

    it "is invalid without a registered user" do  
      opinion = build(:opinion, user: nil)
      expect(opinion).to_not be_valid 
    end

  end

  describe "#user_opinion" do 
    it "displays opinions a the user whose id is provided" do 
      user = create(:user)
      opinion1 = build(:opinion, comment: 'This is my comment', user: user)
      opinion1.save
      opinion2 = build(:opinion, comment: 'This is my second comment', user: user)
      opinion2.save
      expect(Opinion.user_opinions(user.id).first.comment).to eq('This is my comment')
      expect(Opinion.user_opinions(user.id)[1].comment).to eq('This is my second comment') 
    end
  end

end
