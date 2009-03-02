class Warlock < ActiveRecord::Base
  belongs_to :user
  has_many :challengers
  has_many :matches, :through => :challengers
  has_many :challenger_invites
  has_many :matches, :through => :challenger_invites

  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 1
end
