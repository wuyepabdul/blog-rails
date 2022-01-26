class Post < ApplicationRecord
    belongs_to :user, counter_cache: :posts_counter
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
end
