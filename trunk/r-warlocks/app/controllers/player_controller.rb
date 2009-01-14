class PlayerController < ApplicationController
  def create
    @user = session[:user]
    warlock = Warlock.new(params[:warlock])
	warlock.userid = @user.userid
    if warlock.save
      flash[:notice] = 'Warlock' + warlock.name + ' was successfully created.'
      redirect_to :controller => 'player', :action => 'list'
    else
      render :action => 'create'
    end
  end
  
  def list
	@user = session[:user]
  end
  
  def manage
	@user = session[:user]
	@warlocks = @user.warlocks
  end

end
