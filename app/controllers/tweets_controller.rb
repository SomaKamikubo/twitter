class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET /tweets or /tweets.json
  def index
    unless logged_in?
      redirect_to "/tweets/not_logged_in"
    end

    if current_user == nil
      @tweets = Tweet.all
    else
      follow = []
      if Relationship.find_by(following_id: current_user.id)
        follow = current_user.followings.pluck(:id)
      end
      follow.push(current_user.id)
      @tweets = Tweet.where(user_id: follow)
    end
    @tweets = @tweets.order(created_at: :desc)
    @users = User.all
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new(user_id: current_user.id)
    @user = current_user
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if(params[:id] != nil)
      @tweet.origintweet_id = params[:id]
    end
    

   

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_url, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def not_logged_in
    render :layout => "not_logged.html.erb"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:user_id, current_user.id, :letter)
  end
end
