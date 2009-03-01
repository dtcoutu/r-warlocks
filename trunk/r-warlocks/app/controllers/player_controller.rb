class PlayerController < ApplicationController
  def create
    @user = session[:user]
    @warlock = Warlock.new(params[:warlock])
	@warlock.user_id = @user.id
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
	@warlocks = @user.warlocks
  end
  
  def select
	@warlock = Warlock.find(params[:id])
	
	if (@warlock != nil)
	  session[:warlock] = @warlock
	  redirect_to :controller => 'challenge', :action => 'list'
	else
	  render :action => 'manage'
	end
  end

end
