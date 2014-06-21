class EntriesController < ApplicationController

  include Adminable

  before_filter :verify_permission, only: [
    :edit, :update, :confirm_destroy, :destroy]

  def index
    @entries = current_user.entries.skinny.order(:search_text)
  end

  def new
    @entry = Entry.new
    project_guid = params[:project]

    unless project_guid.blank?
      @entry.project_id = Project.find_by_guid(project_guid).id
    end
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to project_entry_path(@entry.project, @entry),
        notice: flash_message(@entry).html_safe
    else
      render action: :new
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to project_entry_path(@entry.project, @entry),
        notice: flash_message(@entry).html_safe
    else
      render action: :edit
    end
  end

  def show
  end

  def destroy
    @entry.destroy
    redirect_to entries_path, notice: 'Deleted.'
  end

  # def search
  #   entries = Entry.skinny.search(params[:term])
  #   render json: entries.map{ |entry| {
  #     id: entry.id,
  #     label: entry.name,
  #     url: entry_path(entry),
  #   }}
  # end

  private
    def verify_permission
      unless current_user.can_edit? @entry.project
        return redirect_to project_entry_path(@entry.project, @entry)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def setup_model
      @entry = current_user.entries.from_param(params[:id])
      @projects = current_user.projects.skinny.ordered.distinct
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(
        :title,
        :project_id,
      )
    end
end
