class Api::V1::TwerpsController < ApplicationController
  before_action :verify_authentication
  before_action :set_user,  only: [:index, :create, :show, :update, :destroy]
  before_action :set_twerp, only: [:show, :update, :destroy]

  
  helper_method :current_user

  def index
    @twerps = @user.twerps
    render json: @user.twerps
  end

 
  def show
    render json: @twerp
  end

  
  def create
    vtwerp=params["twerp"]
    if vtwerp.length > 1 && vtwerp.length < 281
    @twerp = Twerp.create(
        twerp: params["twerp"],
        numfavs: params["numfavs"],
        user_id: @user.id
        )
      render json: @twerp
    else
      render json: { error: "Invalid twerp" }, status: :unauthorized
  end
 end


  def update
    if @twerp.update(twerp_params)
      render json: @twerp
    else
      render json: { error: "Invalid Update" }, status: :unauthorized
    end
  end
  
  def destroy
    byebug
    if current_user == @user
      @twerp.destroy 
    end
  end

  protected 
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params["user_id"])
    end

    def set_twerp
      @twerp= Twerp.find(params["id"])
    end

    # Only allow a trusted parameter "white list" through.
    def twerp_params
      params.require(:twerp).permit(:twerp)
    end

end
