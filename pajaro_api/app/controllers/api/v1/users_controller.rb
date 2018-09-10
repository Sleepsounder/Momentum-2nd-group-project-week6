class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authentication

  def index
    @users = User.all
    render json: @users
  end
  
  
  def create
    user = User.new(users_params)
    if user.save
      render json: user, status: :ok # or 200
    else
      render json: user.errors, status: :bad_request # or 400
    end
  end

    # DELETE /username/1
    def destroy
      @user.destroy
    end
  
  private
    def users_params
      params.permit(:username, :password)
    end

end
