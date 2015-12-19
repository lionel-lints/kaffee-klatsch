class UsersController < ApplicationController
  before_action :verified_request?
  before_action :authenticate, only: %i(show update destroy)
  # before_action :new_user?, only: %i(create)
  respond_to :html, :json

  def show
    @user = User.find(params[:id])
    @surveys = @user.surveys.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      p "!!!!!!!!!!!!!!!!!!!!!!!!"
      p @user
      p '!!!!!!!!!!!!!!!!!!!!!!!!!!'
      render json: true
    else
      render json: false
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    # def new_user?
    #   if current_user != nil
    #     redirect_to user_path(session[:user_id]),  notice: 'User is already logged in.'
    #   end
    # end
end
