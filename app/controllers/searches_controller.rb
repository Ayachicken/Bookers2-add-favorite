class SearchesController < ApplicationController
	def search
        @user_or_book = params[:option]
        @how_search = params[:choice]
        @content = params[:search]
        if @user_or_book == "1"
            @users = User.search(params[:search], @user_or_book, @how_search)
        elsif @user_or_book == "2"
            @books = Book.search(params[:search], @user_or_book, @how_search)
        else
        end
    end
end
