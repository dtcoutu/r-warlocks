class Turn < ActiveRecord::Base
	belongs_to :match
	
	has_many :orders
end
