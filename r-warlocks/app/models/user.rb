class User < ActiveRecord::Base
  validates_uniqueness_of :userid
  validates_length_of :userid, :minimum => 1
end
