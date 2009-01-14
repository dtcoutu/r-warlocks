class User < ActiveRecord::Base
  has_many :warlocks

  validates_uniqueness_of :userid
  validates_length_of :userid, :minimum => 1
end
