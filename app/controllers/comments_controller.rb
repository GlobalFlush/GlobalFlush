class CommentsController < ApplicationController
    
    before_filter :require_user
    
    def new
		@comment = Comment.new
    end
	
    def create
        @comment = Comment.new(params[:comment])
        @comment.user_id = @current_user.id
        if @comment.save
            redirect_to :back
        else
            render
        end
    end
end