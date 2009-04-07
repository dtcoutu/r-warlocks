class Match < ActiveRecord::Base
  has_many :challengers
  has_many :warlocks, :through => :challengers
  has_many :challenger_invites
  has_many :invited_warlocks, :through => :challenger_invites, :source => :warlock
  has_many :turns

  validates_length_of :num_challengers, :minimum => 1
  
  def self.find_open_for_warlock(warlock)
	matches = Match.find(:all)
	open_matches = []
	for match in matches
	  if (match.num_challengers > (match.warlocks.count + match.invited_warlocks.count))
		# include matches that aren't full
		open_matches << match
	  elsif ((!match.invited_warlocks.empty?) && (match.num_challengers == (match.warlocks.count + match.invited_warlocks.count)))
	    # include matches that only have invited positions open and the current warlock is one
		if (match.invited_warlocks.find(warlock))
		  open_matches << match
		end
	  end
	end
	
	open_matches
  end
  
  def leave(warlock)
	warlocks.delete(warlock)
	
	if (warlocks.size == 0)
		delete
	end
  end
end
