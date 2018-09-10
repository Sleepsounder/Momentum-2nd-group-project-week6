class Api::V1::CommentsController < ApplicationController

  before_action :verify_authentication
  before_action :set_twerp,  only: [:index, :create, :show, :update, :destroy]
  before_action :set_comment, only: [:show, :update, :destroy]
  
  def index
    @comments = @twerp.comments
    render json: @twerp.comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.create(
        commenter: params["commenter"],
        body: params["body"],
        twerps_id: @twerps_id
        )
      render json: @comment
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twerp
      @twerp = Twerp.find(params["twerp_id"])
    end

    def set_comment
      @comment= Comment.find(params["id"])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
