class User < ActiveRecord::Base
  before_save {self.email = email.downcase }
	#before_save {email.downcase!}
  validates :name,  presence: true, length: {maximum: 50}
 
	#naver..com 구분을 못해준다 
	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#구분하는 새로운 것
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length:  {minimum: 6}
end
