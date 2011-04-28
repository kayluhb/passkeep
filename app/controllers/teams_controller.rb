class TeamsController < ApplicationController

  before_filter :set_team, :only => [:edit, :show, :update, :confirm_destroy, :destroy]

  def index
    @teams = Team.paginate :page => params[:page], :per_page => 20
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to @team, :notice => team_flash(@team).html_safe
    else
      flash.now[:notice] = "Couldn't save. Please check your form and submit it again!"
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
      flash.now[:error] = "Could not save. Please check the form and try again."
      render :edit
    end
  end

  def confirm_destroy
  end

  def destroy
    @team.destroy
    redirect_to(teams_path, :notice => "Awesome. You deleted #{@team.title}")
  end

  def search
    @teams = Team.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @teams.map(&:attributes) }
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end
    def team_flash team
      render_to_string :partial => "flash", :locals => { :team => team }
    end
end
