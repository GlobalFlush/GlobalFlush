class CommentsController < ApplicationController
    
    before_filter :require_user
    
    def new
		@comment = Comment.new
    end
    
    def create
        @comment.user_id = @current_user.id
        @commentparams = params[:comment]
        @comment.body = @commentparams.body
        @comment.bathroom_id = @commentparams.bathroom_id
        if @comment.save
            redirect_to :back
        else
            render
        end
    end
end
