class PlayerController < ApplicationController
  def create
    warlock = Warlock.new(params[:warlock])
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

end
