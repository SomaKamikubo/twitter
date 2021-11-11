class SearchsController < ApplicationController

    def index
        @users = User.search(params[:search])
    end

    def user
        @users = User.search(params[:search])
    end

    def tweet
        @tweets = Tweet.search(params[:search])
    end
end
