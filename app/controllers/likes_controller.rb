class LikesController < ApplicationController

    def create
      @tweet = Tweet.find(params[:tweet_id])
      like = current_user.likes.build(tweet_id: params[:tweet_id])
      like.save
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
      @tweet = Tweet.find(params[:tweet_id])
      like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
      like.destroy
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
