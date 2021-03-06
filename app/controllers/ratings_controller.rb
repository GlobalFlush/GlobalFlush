# Rating controller
class RatingsController < ApplicationController
	before_filter :require_user

  # GET /ratings
	def new
		@rating = Rating.new
	end

  # POST /ratings
	def create
		@rating = Rating.new(params[:rating])
		if @rating.save
			redirect_to :back
		else
			render
		end
	end
end
