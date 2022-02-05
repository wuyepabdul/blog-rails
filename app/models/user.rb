class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable,
        :jwt_authenticatable,
        :registerable,
        jwt_revocation_strategy: JwtDenylist

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  def recent_posts
    posts.order('created_at Desc').limit(3)
  end
end
