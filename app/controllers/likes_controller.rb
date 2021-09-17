class LikesController < ApplicationController

    def create
      set_tweet
      current_user.likes.create(tweet: @tweet)

        # @like = Like.new()
        # @like.tweet_id = params[:id]
        # @like.user_id = current_user.id

        # respond_to do |format|
        #     if @like.save
        #       format.html { redirect_to root_url }
        #       format.json { render :show, status: :created, location: @like }
        #     else
        #       format.html { render :new, status: :unprocessable_entity }
        #       format.json { render json: @user.errors, status: :unprocessable_entity }
        #     end
        # end
    end

    def destroy
      @tweet = Tweet.find(params[:id])
      current_user.likes.where(tweet: @tweet).destroy_all
      render 'create'
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end

    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:tweet_id,:user_id)
    end
end
