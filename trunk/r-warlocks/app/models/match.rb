class Match < ActiveRecord::Base
  has_many :challengers, :through => :matches
end
