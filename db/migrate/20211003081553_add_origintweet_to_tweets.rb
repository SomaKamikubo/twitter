class AddOrigintweetToTweets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :origintweet, foreign_key: true
  end
end
