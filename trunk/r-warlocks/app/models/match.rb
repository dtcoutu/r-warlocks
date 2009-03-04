class Match < ActiveRecord::Base
  has_many :challengers
  has_many :warlocks, :through => :challengers
  has_many :challenger_invites
  has_many :invited_warlocks, :through => :challenger_invites, :source => :warlock

  validates_length_of :num_challengers, :minimum => 1
end
