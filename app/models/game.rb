class Game < ActiveRecord::Base

  ratyrate_rateable "overall"
  has_and_belongs_to_many :users
  has_many :ratings

  validates_uniqueness_of :name


end