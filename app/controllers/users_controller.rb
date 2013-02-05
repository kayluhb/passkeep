class UsersController < ApplicationController

  before_filter :set_user, only: [:edit, :show, :update, :confirm_destroy, :destroy]

  def index
    @users = User.ordered.paginate page: params[:page], per_page: 100
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    authorize! :create, @user
    if @user.save
      redirect_to users_path, notice: user_flash(@user).html_safe
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to users_path, notice: user_flash(@user).html_safe
    else
      render :edit
    end
  end

  def confirm_destroy
    authorize! :destroy, @user
  end

  def destroy
    authorize! :destroy, @user
    @user.destroy unless @user.super_user
    notice = !@user.super_user ? "Awesome. You deleted #{@user.title}" : "Woah. Not so fast. They're a super user"
    redirect_to(users_path, notice: notice)
  end

  def search
    query = params[:term]
    @users = User.skinny.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
    respond_to do |format|
      format.html
      format.json {
        render json: @users.map{ |user| { name: user.full_name, id: user.id } }
      }
    end
  end

  private
    def set_user
      @user = User.find_by_guid!(params[:id])
    end

    def user_flash user
      render_to_string partial: "flash", locals: { user: user }
    end
end
