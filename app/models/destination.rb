class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts 

    def most_liked_post
        self.posts.max_by{|post|post.likes}
    end

    def average_age
        ages = self.bloggers.uniq.sum{|blogger|blogger.age}.to_f
        ages/self.bloggers.uniq.count
    end
end
