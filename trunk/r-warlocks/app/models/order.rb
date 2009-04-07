class Order < ActiveRecord::Base
	belongs_to :order_maker
	belongs_to :turn
	
	has_many :gestures
end
