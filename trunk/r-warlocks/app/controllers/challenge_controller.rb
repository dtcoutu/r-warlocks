class ChallengeController < ApplicationController
  def create
	match = Match.new(params[:match])
	if match.save
      flash[:notice] = 'Challenge' + match.id.to_s + ' was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'create'
    end
  end

  def list
  end

end
