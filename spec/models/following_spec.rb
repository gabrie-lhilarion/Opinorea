require 'rails_helper'

RSpec.describe Following, type: :model do
  context "Active Record Validation" do
    it "belongs to user" do
      expect(Following.reflect_on_association(:user).macro).to be(:belongs_to)
    end
  end

  describe "Instance methods" do
    context "#first follower" do
      it "it displays the first follower of a user if any" do
        user_1 = create(:user)
        user_2 = create(:user)
        user_3 = create(:user)

        f1_of_user_1 = create(:following, follower_id: user_2.id, user_id: user_1.id, follower_name: user_2.fullname)
        f2_of_user_1 = create(:following, follower_id: user_3.id, user_id: user_1.id, follower_name: user_3.fullname)

        expect(Following.first_follower(user_1.id)).to eq(f1_of_user_1)
        expect(Following.first_follower(user_1.id) == f1_of_user_1).to be(true)
        expect(Following.first_follower(user_1.id) == f2_of_user_1).to be(false)
      end
    end

    context "#followers" do
      it "lists followers of a giving user for counting" do
        user_1 = create(:user)
        user_2 = create(:user)
        user_3 = create(:user)
        user_4 = create(:user)
        user_5 = create(:user)

        f1_of_user_1 = create(:following, follower_id: user_2.id, user_id: user_1.id, follower_name: user_2.fullname)
        f2_of_user_1 = create(:following, follower_id: user_3.id, user_id: user_1.id, follower_name: user_3.fullname)
        f3_of_user_1 = create(:following, follower_id: user_4.id, user_id: user_1.id, follower_name: user_4.fullname)
        f1_of_user_3 = create(:following, follower_id: user_1.id, user_id: user_3.id, follower_name: user_3.fullname)

        expect(Following.followers(user_1.id)).to include(f2_of_user_1)
        expect(Following.followers(user_1.id).count).to eq(3)
        expect(Following.followers(user_1.id)).to_not include(f1_of_user_3)
      end
    end

    context "#following" do
      it "retrieves a user's followings for counting" do
        user_1 = create(:user)
        user_2 = create(:user)
        user_3 = create(:user)
        user_4 = create(:user)
        user_5 = create(:user)

        followed_1 = create(:following, follower_id: user_1.id, user_id: user_2.id, follower_name: user_1.fullname)
        followed_2 = create(:following, follower_id: user_1.id, user_id: user_3.id, follower_name: user_1.fullname)
        followed_3 = create(:following, follower_id: user_1.id, user_id: user_4.id, follower_name: user_1.fullname)

        expect(Following.following(user_1.id)).to include(followed_1)
        expect(Following.following(user_1.id).count).to eq(3)
      end
    end

    context "#not_followers" do
      it "check if a user is not a followers of another" do
        user_1 = create(:user)
        user_2 = create(:user)
        user_3 = create(:user)
        user_4 = create(:user)
        user_5 = create(:user)

        followed_1 = create(:following, follower_id: user_1.id, user_id: user_2.id, follower_name: user_1.fullname)
        followed_2 = create(:following, follower_id: user_1.id, user_id: user_3.id, follower_name: user_1.fullname)
        followed_3 = create(:following, follower_id: user_2.id, user_id: user_4.id, follower_name: user_2.fullname)

        expect(Following.not_follower?(user_2.id, user_4.id)).to be(true)
        expect(Following.not_follower?(user_4.id, user_2.id)).to be(false)
      end
    end

    context "#is_a_followers" do
      it "check if a user is a followers of another" do
        user_1 = create(:user)
        user_2 = create(:user)
        user_3 = create(:user)
        user_4 = create(:user)
        user_5 = create(:user)

        followed_1 = create(:following, follower_id: user_1.id, user_id: user_2.id, follower_name: user_1.fullname)
        followed_2 = create(:following, follower_id: user_1.id, user_id: user_3.id, follower_name: user_1.fullname)
        followed_3 = create(:following, follower_id: user_2.id, user_id: user_4.id, follower_name: user_2.fullname)

        expect(Following.is_a_follower?(user_4.id, user_2.id)).to be(true)
      end
    end

    context "#following_record" do
      it "produces the id of a follower" do
        user_1 = create(:user)
        user_2 = create(:user)
        user_3 = create(:user)
        user_4 = create(:user)
        user_5 = create(:user)

        followed_1 = create(:following, follower_id: user_1.id, user_id: user_2.id, follower_name: user_1.fullname)

        expect(Following.following_record(user_2.id, user_1.id)[0]).to eq(followed_1.id)
      end
    end
  end
end
