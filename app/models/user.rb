class User < ActiveRecord::Base
    has_many :user_courses
    has_many :user_lessons
    has_many :user_words
    has_many :practices

    mount_uploader :image, ImageUploader

    before_save {self.email = email.downcase }
    validates :name,length: {maximum:50},presence:true
    validates :email,length: {maximum:100}, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    uniqueness: {case_sensitive:false}
    has_secure_password
    PASSWORD_FORMAT = /\A
        (?=.{8,})          # Must contain 8 or more characters
        (?=.*\d)           # Must contain a digits
    /x
    validates :password,length: {:within => 8..40}, format: { with: PASSWORD_FORMAT }, allow_blank: true
    validate :image_size
    private
    # Xac thuc kich thuoc cua 1 anh tai len.
    def image_size
        if image.size > 5.megabytes
          errors.add(:image,"should be less than 5MB")
        end
      end
end
