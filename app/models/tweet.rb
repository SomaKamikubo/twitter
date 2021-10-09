class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :like_users, through: :likes, source: :user 
    has_many :replys, class_name: "Tweet", foreign_key: "origintweet_id"
    belongs_to :origintweet, class_name:"Tweet" ,optional: true
end