class TeamsController < ApplicationController

  include Adminable

  def index
    @teams = Team.skinny.ordered
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to team_path(@team), notice: flash_message(@team).html_safe
    else
      render action: :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to team_path(@team), notice: flash_message(@team).html_safe
    else
      render action: :edit
    end
  end

  def show
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: 'Deleted.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def setup_model
      @team = Team.from_param(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(
        :name,
        :role_id,
        { project_ids: [] },
        { user_ids: [] },
      )
    end

end
