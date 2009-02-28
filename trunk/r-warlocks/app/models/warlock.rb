class Warlock < ActiveRecord::Base
  belongs_to :user
  has_many :challengers
  has_many :matches, :through => :challengers

  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 1
end
