class RelationshipsController < ApplicationController
	def follow
		current_user.follow(params[:id])
		redirect_back(fallback_location: root_path)
	end

	def unfollow
		current_user.unfollow(params[:id])
		redirect_back(fallback_location: root_path)
	end

	def following
		@user = User.find(params[:id])
		@users = @user.following_user
		render 'relationships/following'
	end

	def follower
		@user = User.find(params[:id])
		@users = @user.follower_user
		render 'relationships/follower'
	end
end
