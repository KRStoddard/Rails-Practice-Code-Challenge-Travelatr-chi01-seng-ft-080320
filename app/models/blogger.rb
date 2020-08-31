class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts 
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than_or_equal_to: 1}  
    validates :bio, length: {minimum: 31}

    def most_popular_post
        self.posts.max_by {|post| post.likes}
    end
end
