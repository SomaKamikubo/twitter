class RenameTweetColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tweets, :tweet, :letter
  end
end
