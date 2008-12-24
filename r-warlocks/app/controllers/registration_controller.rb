class RegistrationController < ApplicationController
  def delete
	@user = session[:user]
	@user.delete
  end
  
  def login
	if request.post?
		@user = User.find_by_userid_and_password(params[:user][:userid], params[:user][:password])
		if (@user.nil?)
			@user = User.new
			@user.errors.add_to_base("Invalid userid and/or password.")
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
      flash[:notice] = 'User was successfully registered.'
      redirect_to :controller => 'player', :action => 'list'
    else
      render :action => 'new'
    end
  end

end
