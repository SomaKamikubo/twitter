class SearchsController < ApplicationController

    def index
        @users = User.none
    end

    def user
        @users = User.search(params[:user])
    end

    def tweet
        @tweets = Tweet.search(params[:search])
    end
end
