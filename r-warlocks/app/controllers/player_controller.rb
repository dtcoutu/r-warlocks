class PlayerController < ApplicationController
  def create
    @user = session[:user]
    @warlock = Warlock.new(params[:warlock])
    @user.warlocks<<@warlock
    if @warlock.save
      flash[:notice] = 'Warlock' + @warlock.name + ' was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'create'
    end
  end
  
  def list
	@user = session[:user]
	@warlocks = @user.warlocks
  end
  
  def manage
	@user = session[:user]
	print "user = " + @user.username + "; " + @user.warlocks.length.to_s + "\n"
	@warlocks = @user.warlocks
  end
  
  def select
	@warlock = Warlock.find(params[:id])
	
	if (@warlock != nil)
	  session[:warlock] = @warlock
	  redirect_to :controller => 'game', :action => 'list'
	else
	  render :action => 'manage'
	end
  end

end
