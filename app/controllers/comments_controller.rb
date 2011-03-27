class CommentsController < ApplicationController
    
    before_filter :require_user
    
    def new
    
    end
    
    def create
        @comment = Comment.new
        @comment.user_id = @current_user
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
