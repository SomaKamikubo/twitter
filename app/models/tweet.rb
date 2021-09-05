class Tweet < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    has_many :likes, foreign_key: "reference_id"
    has_many :user, through: :likes
end
