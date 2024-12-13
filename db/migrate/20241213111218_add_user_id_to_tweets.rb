class AddUserIdToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :user_id, :integer
    add_foreign_key :tweets, :users
  end
end
