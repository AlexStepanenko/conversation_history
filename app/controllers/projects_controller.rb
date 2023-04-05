# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.page(params[:page]).per(10)
  end
end
