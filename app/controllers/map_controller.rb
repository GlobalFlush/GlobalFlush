# Map controller
class MapController < ApplicationController

  # index action
	def index
		@bathrooms = Bathroom.search_by_address(params[:keyword])
		
		@bathrooms_with_address_ratings = @bathrooms.map { |b| [b, b.address, b.ratings] }
	end
	
end
