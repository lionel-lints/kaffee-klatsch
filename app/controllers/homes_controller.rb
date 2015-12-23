class HomesController < ApplicationController
  before_action :authenticate, only: %i(show)

  layout 'home'

  def show
    @user = User.find(current_user.id)
    @surveys = @user.surveys.all
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

end
