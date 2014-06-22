class UsersController < ApplicationController

  include Adminable

  def index
    @users = User.skinny.ordered
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: flash_message(@user).html_safe
    else
      render action: :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: flash_message(@user).html_safe
    else
      render action: :edit
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Deleted.'
  end

  private
    def verify_permission
      unless current_user.can_edit? @user
        return redirect_to users_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def setup_model
      @user = User.from_param(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :email,
        :first_name,
        :last_name,
        :password,
        :password_confirmation,
        { team_ids: [] },
      )
    end

end
