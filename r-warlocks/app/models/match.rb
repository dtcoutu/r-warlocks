class Match < ActiveRecord::Base
  has_many :challengers
  has_many :warlocks, :through => :challengers

  validates_length_of :num_challengers, :minimum => 1
end
