class ChallengeController < ApplicationController
  def create
	@match = Match.new(params[:match])
	if (params[:invited_challengers] != nil)
      invited_challengers = params[:invited_challengers]
	  for i in (1..5) do
	    if (!invited_challengers[i.to_s][:warlock_name].empty?)
	      warlock = Warlock.find_by_name(invited_challengers[i.to_s][:warlock_name])
	      @match.invited_warlocks << warlock
		end
	  end
	end
	if @match.save
	  @warlock = session[:warlock]
	  @match.warlocks << @warlock
	  @match.save
	  
      flash[:notice] = 'Challenge' + @match.id.to_s + ' was successfully created.'
      redirect_to :action => 'list'
    else
	  puts "going to the create page"
      render :action => 'create'
    end
  end
  
  def join
    @warlock = session[:warlock]
	match = Match.find(params[:id])
	match.warlocks << @warlock
    if (match.warlocks.count == match.num_challengers)
      match.status = "Started"
      match.save
	end
	
	redirect_to :action => 'list'
  end

  def list
	@warlock = session[:warlock]
	@pending_challenges = @warlock.matches.find_all_by_status("Open")
	@ready_matches = @warlock.matches.find_all_by_status("Started")
  end
  
  def list_open
    @warlock = session[:warlock]
	# Need to list all matches that have at least one space not specified.
	# check num_challengers - 1 - match.invited_warlocks.size - match.warlocks.size excluding those that the warlock is in the invited_warlocks list
	# also need to add all the matches that the warlock is in the invited_warlocks list.
	matches = Match.find(:all)
	@open_matches = []
	for match in matches
	  if (match.num_challengers > (match.warlocks.count + match.invited_warlocks.count))
		# include matches that aren't full
		@open_matches << match
	  elsif ((!match.invited_warlocks.empty?) && (match.num_challengers == (match.warlocks.count + match.invited_warlocks.count)))
	    # include matches that only have invited positions open and the current warlock is one
		if (match.invited_warlocks.find(@warlock))
		  @open_matches << match
		end
	  end
	end
	
	puts "matches = " + matches.size.to_s
	puts "open_matches = " + @open_matches.size.to_s
  end

end
