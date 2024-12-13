class AddMessageToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :message, :string
  end
end
