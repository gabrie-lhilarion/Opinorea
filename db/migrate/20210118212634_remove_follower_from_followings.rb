class RemoveFollowerFromFollowings < ActiveRecord::Migration[6.0]
  def change
    remove_column :followings, :follower, :integer
  end
end
