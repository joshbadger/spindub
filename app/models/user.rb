class User < ActiveRecord::Base
  has_many :flies
  
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, uniqueness: {case_sensitive: false}
end
