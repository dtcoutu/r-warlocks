class RegistrationController < ApplicationController
  def delete
	@user = session[:user]
	@user.delete
	session[:user] = nil
	redirect_to :action => 'show'
  end
  
  def login
	if request.post?
		@user = User.find_by_username_and_password(params[:user][:username], params[:user][:password])
		if (@user.nil?)
			@user = User.new
			@user.errors.add_to_base("Invalid username and/or password.")
			render
		else
			session[:user] = @user
			redirect_to :controller => 'player', :action => 'list'
		end
	else
		render
	end
  end
  
  def new
    @user = User.new(params[:user])
    if @user.save
	  session[:user] = @user
      flash[:notice] = 'User was successfully registered.'
      redirect_to :controller => 'player', :action => 'list'
    else
      render :action => 'new'
    end
  end
  
  def show
  end

end
