class User < ApplicationRecord
    has_secure_password
    has_many :tweets, foreign_key: "reference_id"
    has_many :likes, foreign_key: "reference_id"
    has_many :tweets, through: :likes
end
