class Article < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :author, presence: true
    validates :published_at, presence: true

    def published?
        published_at <= Time.current
    end
    
end
