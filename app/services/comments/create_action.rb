# frozen_string_literal: true

require 'utils/callable'

module Comments
  class CreateAction
    include Utils::Callable

    attr_reader :project, :comments, :success, :message

    def initialize(project, user, options)
      @project = project
      @user = user
      @status = options.delete(:status)
      @text = options.delete(:text)
      @comments = []
      @success = false
    end

    def call
      change_project_status
      add_comment
      save
      self
    end

    private

    attr_reader :user, :status, :text

    def change_project_status
      return unless status && status != project.status

      project.assign_attributes(status: status)
      add_comment("Status was changed from #{project.status} to #{status}.")
    end

    def add_comment(value = text)
      return unless value.present?

      @comments.push(Comment.new(text: value, user: user, project: project))
    end

    def save
      project.save && comments.all?(&:save) ? handle_success : handle_errors
    end

    def handle_success
      @success = true
      @comments = Comment.where(id: comments.map(&:id))
    end

    def handle_errors
      @message = comments.map do |comment|
        comment.errors.full_messages
      end.flatten.concat(
        project.errors.full_messages
      )
    end
  end
end
