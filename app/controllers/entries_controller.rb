class EntriesController < ApplicationController

  before_filter :set_entry, :only => [:edit, :show, :update, :confirm_destroy, :destroy]

  def index
    @entries = current_user.entries.ordered.paginate :page => params[:page]
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      redirect_to project_entry_path(@entry.project, @entry), :notice => entry_flash(@entry).html_safe
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @entry.update_attributes(params[:entry])
      redirect_to project_entry_path(@entry.project, @entry), :notice => entry_flash(@entry).html_safe
    else
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
      @entry = Entry.find_by_guid!(params[:id])
    end

    def entry_flash entry
      render_to_string :partial => "flash", :locals => { :entry => entry }
    end

end
