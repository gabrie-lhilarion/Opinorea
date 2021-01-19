class AddDetailsToFollowings < ActiveRecord::Migration[6.0]
  def change
    add_column :followings, :follower_id, :integer
    add_column :followings, :follower_name, :string
  end
end
