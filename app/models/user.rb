class User < ApplicationRecord
    has_secure_password
    has_many :tweets , dependent: :destroy
    has_many :likes , dependent: :destroy
    has_many :tweets, through: :likes

    def like(tweet)
        like_tweets << tweet
    end

    def unlike(tweet)
        like_tweets.destroy(tweet)
    end

    def like?(tweet)
        likes.exists? tweet: tweet
    end
end
