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

  def list
	@warlock = session[:warlock]
	@pending_challenges = @warlock.matches
  end

end
