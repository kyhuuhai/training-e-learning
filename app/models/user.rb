class User < ActiveRecord::Base
    has_many :user_courses
    has_many :user_lessons
    has_many :user_words
    has_many :practices

    validates :name,length: {maximum:50},presence:true
    validates :email,length: {maximum:100}, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    uniqueness: {case_sensitive:false}
<<<<<<< HEAD
=======
    has_secure_password
    PASSWORD_FORMAT = /\A
        (?=.{8,})          # Must contain 8 or more characters
        (?=.*\d)           # Must contain a digits
    /x
    validates :password,length: {:within => 8..40}, format: { with: PASSWORD_FORMAT }, allow_blank: true
    validate :image_size

    # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string,cost: cost)
    end
    private
    # Xac thuc kich thuoc cua 1 anh tai len.
    def image_size
        if image.size > 5.megabytes
          errors.add(:image,"should be less than 5MB")
        end
      end
>>>>>>> log-in and log-out
end
