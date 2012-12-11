class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_profile_name(params[:id])
  	if @user 
  			@happenings = @user.happenings.all
  			render :action => :show
  	else
  		render :file => 'public/404', :status => 404, :fommats => [:html]
  	end
  end
end
