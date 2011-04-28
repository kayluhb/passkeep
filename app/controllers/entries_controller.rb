class EntriesController < ApplicationController

  before_filter :set_entry, :only => [:edit, :show, :update, :confirm_destroy, :destroy]

  def index
    @entries = Entry.paginate :page => params[:page], :per_page => 20
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      redirect_to @entry, :notice => entry_flash(@entry).html_safe
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
    if @entry.update_attributes(params[:entry])
      redirect_to @entry, :notice => entry_flash(@entry).html_safe
    else
      flash.now[:error] = "Could not save. Please check the form and try again."
      render :edit
    end
  end

  def confirm_destroy
  end

  def destroy
    @entry.destroy
    redirect_to(entries_path, :notice => "Awesome. You deleted #{@entry.title}")
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end
    def entry_flash entry
      render_to_string :partial => "flash", :locals => { :entry => entry }
    end
end