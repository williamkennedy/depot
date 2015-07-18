class SessionsController < ApplicationController
	skip_before_action :authorize
  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"
  	end
  end

  def destroy
  	session[:user_id]
    session[:user_id] = nil
    respond_to do |format|
        format.html { redirect_to users_url, notice: "Logged out" }
        format.json { head :no_content }
      end
  end
end
