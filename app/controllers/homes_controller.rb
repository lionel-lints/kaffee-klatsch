class HomesController < ApplicationController
  before_action :authenticate

  layout 'home'

  def show
    # @user = User.find(params[:username])
  end

  def signin
    user = User.authenticate(params[:username], params[:email], params[:password])
    if user
      session[:user_id] = user.id
      render json: true
    else
      render json: false
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
