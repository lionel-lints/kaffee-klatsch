class RootsController < ApplicationController
  layout 'root'

  def landing
  end

  def signout
    session[:user_id] = nil
    current_user = nil

    if session[:user_id] == nil && current_user == nil
      render json: true
    else
      render json: false
    end
  end

end
