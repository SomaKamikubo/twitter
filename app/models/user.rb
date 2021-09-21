class User < ApplicationRecord
    has_secure_password
    has_many :tweets
    has_many :likes
    # has_many :tweets, through: :likes

    def like?(tweet)
        likes.exists? tweet: tweet
    end
end
