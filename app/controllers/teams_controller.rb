class TeamsController < ApplicationController

  before_filter :set_team, :only => [:edit, :show, :update, :confirm_destroy, :destroy]

  def index
    @teams = Team.paginate :page => params[:page]
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to @team, :notice => team_flash(@team).html_safe
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @team.update_attributes(params[:team])
      redirect_to @team, :notice => team_flash(@team).html_safe
    else
      render :edit
    end
  end

  def confirm_destroy
  end

  def destroy
    @team.destroy
    redirect_to(teams_path, :notice => "Awesome. You deleted #{@team.name}")
  end

  private
    def set_team
      @team = Team.find_by_guid!(params[:id])
    end

    def team_flash team
      render_to_string :partial => "flash", :locals => { :team => team }
    end

end
