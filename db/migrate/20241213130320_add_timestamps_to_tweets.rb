class AddTimestampsToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :timestamps, :datetime
  end
end
