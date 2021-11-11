class User < ApplicationRecord
  has_secure_password
  has_many :tweets
  has_many :likes

  #関連するツイートを持ってくる
  has_many :like_tweets, through: :likes, source: :tweet
  has_many :follow_tweets, through: :followings, source: :tweet

  #フォロー
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  #フォロワー
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def like?(tweet)
    likes.exists? tweet: tweet
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def self.search(search)
    return User.none unless search
    User.where(['name LIKE ?', "%#{search}%"])      
  end


end
