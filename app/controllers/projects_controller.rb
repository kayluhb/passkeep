class ProjectsController < ApplicationController

  include Adminable

  before_filter :verify_permission, only: [
    :edit, :update, :confirm_destroy, :destroy]

  def index
    @projects = Project.skinny.ordered

    @status_id = params[:status_id] || 1
    @projects = @projects.where(status_id: @status_id)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to project_path(@project), notice: flash_message(@project).html_safe
    else
      render action: :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project), notice: flash_message(@project).html_safe
    else
      render action: :edit
    end
  end

  def show
    @entries = @project.entries.active.ordered
    @archived_entries = @project.entries.archived.ordered
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Deleted.'
  end

  private
    def verify_permission
      unless current_user.can_edit? @project
        return redirect_to project_path(@project)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def setup_model
      @project = Project.from_param(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(
        :name,
        :status_id,
        { team_ids: [] },
      )
    end

end
