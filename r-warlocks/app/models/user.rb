class User < ActiveRecord::Base
  has_many :warlocks

  validates_uniqueness_of :username
  validates_length_of :username, :minimum => 1
end
