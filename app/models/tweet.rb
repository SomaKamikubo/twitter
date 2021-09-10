class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes
#    has_many :user, through: :likes
end