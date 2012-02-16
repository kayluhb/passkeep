class UsersController < ApplicationController

  before_filter :set_user, :only => [:edit, :show, :update, :confirm_destroy, :destroy]

  def index
    @users = User.paginate :page => params[:page], :per_page => 100
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => user_flash(@user).html_safe
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
      redirect_to users_path, :notice => user_flash(@user).html_safe
    else
      render :edit
    end
  end

  def confirm_destroy
  end

  def destroy
    @user.destroy
    redirect_to(users_path, :notice => "Awesome. You deleted #{@user.title}")
  end

  def search
    query = params[:term]
    @users = User.skinny.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{query}%", "%#{query}%")
    respond_to do |format|
      format.html
      format.json {
        render :json => @users.map{ |user| { :name => user.full_name, :id => user.id } }
      }
    end
  end

  private
    def set_user
      @user = User.find_by_guid!(params[:id])
    end

    def user_flash user
      render_to_string :partial => "flash", :locals => { :user => user }
    end
end
