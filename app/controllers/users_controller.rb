class UsersController < ApplicationController
  def new
    @user = User.new()
    render :layout => "not_logged.html.erb"
  end

  def show
    set_user
    @tweets = @user.tweets.order(created_at: :desc)
    @like_tweets = @user.like_tweets.order(created_at: :desc)
    # @likes = Like.where(user_id: @user.id)
    # @liketweetid = @likes.pluck(:tweet_id)
    # @like_tweets = Tweet.where(id: @liketweetid)
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(comment_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/1/edit
  def edit
    set_user
  end

  def followings
    set_user
  end

  def followers
    set_user
  end

  def search
    @users = User.search(params[:user])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def comment_params
    params.require(:user).permit(:comment)
  end

  
end
