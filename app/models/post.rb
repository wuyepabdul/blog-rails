class Post < ApplicationRecord
    belongs_to :user, optional: true, counter_cache: :posts_counter
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    def update_posts_counter
        comments.last(5)
    end

    def update_posts_counter
        user.posts_counter = 0 if user.posts_counter.nil?
        user.posts_counter += 1
        user.save
    end
end
