class ProjectsController < ApplicationController
  before_filter :authenticate_user!  
  
  def index
    @projects = current_user.projects.order('id desc')
  end
end
