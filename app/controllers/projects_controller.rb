class ProjectsController < ApplicationController

  before_filter :set_project, :only => [:edit, :show, :update, :confirm_destroy,
                                        :destroy, :tagged_entries]

  def index
    @projects = current_user.projects.paginate :page => params[:page]
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to projects_path, :notice => project_flash(@project).html_safe
    else
      render :new
    end
  end

  def edit
    @tags = @project.entries.tag_counts_on(:tags).order(:name)
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to projects_path, :notice => project_flash(@project).html_safe
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

  def search
    query = params[:term]
    @projects = Project.skinny.where("name ILIKE ?", "%#{query}%")
    respond_to do |format|
      format.html
      format.json {
        render :json => @projects.map{ |p| { :name => p.name, :id => p.id } }
      }
    end
  end

  def tagged_entries
    tags = params[:tags]
    unless tags.blank?
      @entries = @project.entries.tagged_with(params[:tags])
    else
      @entries = @project.entries
    end
    @entries = @entries.skinny.ordered
    respond_to do |format|
      format.html
      format.json {
        render :json => @entries.to_json(:methods => [:project_guid, :project_name])
      }
    end
  end

  private
    def set_project
      @project = Project.find_by_guid!(params[:id])
    end

    def project_flash project
      render_to_string :partial => "flash", :locals => { :project => project }
    end

end
