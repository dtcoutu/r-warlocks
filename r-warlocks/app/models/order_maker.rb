class OrderMaker < ActiveRecord::Base
	belongs_to :challenger
	
	has_many :orders
end
