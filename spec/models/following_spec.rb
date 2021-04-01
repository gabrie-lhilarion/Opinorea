require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Active Record Validation' do
    it 'belongs to user' do
      expect(Following.reflect_on_association(:user).macro).to be(:belongs_to)
    end
  end

  describe 'Instance methods' do
    context '#first follower' do
      it 'it displays the first follower of a user if any' do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)

        f1ofuser1 = create(:following, follower_id: user2.id, user_id: user1.id, follower_name: user2.fullname)
        f2ofuser1 = create(:following, follower_id: user3.id, user_id: user1.id, follower_name: user3.fullname)

        expect(Following.first_follower(user1.id)).to eq(f1ofuser1)
        expect(Following.first_follower(user1.id) == f1ofuser1).to be(true)
        expect(Following.first_follower(user1.id) == f2ofuser1).to be(false)
      end
    end

    context '#followers' do
      it 'lists followers of a giving user for counting' do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)

        create(:following, follower_id: user2.id, user_id: user1.id, follower_name: user2.fullname)
        f2ofuser1 = create(:following, follower_id: user3.id, user_id: user1.id, follower_name: user3.fullname)
        create(:following, follower_id: user4.id, user_id: user1.id, follower_name: user4.fullname)
        f1ofuser3 = create(:following, follower_id: user1.id, user_id: user3.id, follower_name: user3.fullname)

        expect(Following.followers(user1.id)).to include(f2ofuser1)
        expect(Following.followers(user1.id).count).to eq(3)
        expect(Following.followers(user1.id)).to_not include(f1ofuser3)
      end
    end

    context '#following' do
      it 'retrieves a user\'s followings for counting' do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)
        create(:user)

        followed1 = create(:following, follower_id: user1.id, user_id: user2.id, follower_name: user1.fullname)
        create(:following, follower_id: user1.id, user_id: user3.id, follower_name: user1.fullname)
        create(:following, follower_id: user1.id, user_id: user4.id, follower_name: user1.fullname)

        expect(Following.following(user1.id)).to include(followed1)
        expect(Following.following(user1.id).count).to eq(3)
      end
    end

    context '#not_followers' do
      it 'check if a user is not a followers of another' do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)
        create(:user)

        create(:following, follower_id: user1.id, user_id: user2.id, follower_name: user1.fullname)
        create(:following, follower_id: user1.id, user_id: user3.id, follower_name: user1.fullname)
        create(:following, follower_id: user2.id, user_id: user4.id, follower_name: user2.fullname)

        expect(Following.not_follower?(user2.id, user4.id)).to be(true)
        expect(Following.not_follower?(user4.id, user2.id)).to be(false)
      end
    end

    context '#a_followers' do
      it 'check if a user is a followers of another' do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)

        create(:following, follower_id: user1.id, user_id: user2.id, follower_name: user1.fullname)
        create(:following, follower_id: user1.id, user_id: user3.id, follower_name: user1.fullname)
        create(:following, follower_id: user2.id, user_id: user4.id, follower_name: user2.fullname)

        expect(Following.a_follower?(user4.id, user2.id)).to be(true)
      end
    end

    context '#following_record' do
      it 'produces the id of a follower' do
        user1 = create(:user)
        user2 = create(:user)
        create(:user)
        create(:user)

        followed1 = create(:following, follower_id: user1.id, user_id: user2.id, follower_name: user1.fullname)

        expect(Following.following_record(user2.id, user1.id)[0]).to eq(followed1.id)
      end
    end
  end
end
