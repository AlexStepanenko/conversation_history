# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            :comments_list, 
            partial: 'comments/comment', 
            locals: { comment: @comment }
          )
        end
        format.html { redirect_to project_path(@project) }
      end
    else
      render 'projects/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
