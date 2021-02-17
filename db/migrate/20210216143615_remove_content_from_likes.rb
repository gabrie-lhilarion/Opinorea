class RemoveContentFromLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :content, :string
  end
end
