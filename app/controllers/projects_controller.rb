class ProjectsController < ApplicationController

  before_filter :set_project, :only => [:edit, :show, :update, :confirm_destroy, :destroy]

  def index
    @projects = Project.paginate :page => params[:page]
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, :notice => project_flash(@project).html_safe
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice => project_flash(@project).html_safe
    else
      render :edit
    end
  end

  def confirm_destroy
  end

  def destroy
    @project.destroy
    redirect_to(projects_path, :notice => "Awesome. You deleted #{@project.name}")
  end

  private
    def set_project
      @project = Project.find_by_guid!(params[:id])
    end

    def project_flash project
      render_to_string :partial => "flash", :locals => { :project => project }
    end

end
