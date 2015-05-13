class User < ActiveRecord::Base
  ratyrate_rater
  has_secure_password
  has_and_belongs_to_many :games

end