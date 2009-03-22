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
  
  def leave
    @warlock = session[:warlock]
	match = Match.find(params[:id])
	match.leave(@warlock)
	
    redirect_to :action => 'list'
  end

  def list
	@warlock = session[:warlock]
	@pending_challenges = @warlock.matches.find_all_by_status("Open")
	@ready_matches = @warlock.matches.find_all_by_status("Started")
  end
  
  def list_open
    @warlock = session[:warlock]

	@open_matches = Match.find_open_for_warlock(@warlock)
  end

end
