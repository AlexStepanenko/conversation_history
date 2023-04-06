# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    result = Comments::CreateAction.call(@project, current_user, comment_params)

    if result.success
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            :new_comments,
            partial: 'comments/comments', 
            locals: { comments: result.comments }
          )
        end
        format.html { redirect_to project_path(@project) }
      end
    else
      redirect_to project_path(@project), alert: result.message
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :status)
  end
end
