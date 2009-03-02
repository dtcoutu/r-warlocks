class ChallengerInvite < ActiveRecord::Base
	belongs_to :match
	belongs_to :warlock
end
