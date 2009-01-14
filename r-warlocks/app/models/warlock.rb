class Warlock < ActiveRecord::Base
  belongs_to :user

  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 1
end
