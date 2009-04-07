class Challenger < ActiveRecord::Base
	belongs_to :match
	belongs_to :warlock
	
	has_one :order_maker
	
	has_many :orders, :through => :order_maker
end
