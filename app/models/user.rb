class User < ActiveRecord::Base
    has_many :user_courses
    has_many :user_lessons
    has_many :user_words
    has_many :practices

    validates :name,length: {maximum:50},presence:true
    validates :email,length: {maximum:100}, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    uniqueness: {case_sensitive:false}
end
