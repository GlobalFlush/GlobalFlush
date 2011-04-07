class RatingsController < ApplicationController
	before_filter :require_user
	
	def new
		@rating = Rating.new
	end
	
	def create
		@rating = Rating.new(params[:rating])
		if @rating.save
			redirect_to :back
		else
			render
		end
	end
end
