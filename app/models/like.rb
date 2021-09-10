class Like < ApplicationRecord
    belongs_to :tweet, foreign_key: "tweet_id", optional: true
    belongs_to :user, foreign_key: "user_id", optional: true
end
