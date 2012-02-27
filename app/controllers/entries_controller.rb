class EntriesController < ApplicationController

  before_filter :set_entry, :only => [:edit, :show, :update, :confirm_destroy, :destroy]

  def index
    @entries = current_user.entries.ordered.paginate :page => params[:page]
    @tags = current_user.entries.tag_counts_on(:tags).order(:name)
  end

  def new
    @entry = Entry.new
    project_guid = params[:project]
    unless project_guid.blank?
      @entry.project_id = Project.find_by_guid(project_guid).id
    end
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
    respond_to do |format|
      format.html
      format.json { render :json => @entry.to_json(:include => [:project],
          :methods => [:notes, :password, :username, :url, :tags]) }
    end
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

  def paginate
    tag_name = params[:tag_name].to_s
    entries = current_user.entries
    entries = entries.tagged_with(tag_name) unless tag_name.blank?
    entries = entries.skinny.ordered.limit(30).offset(params[:idx])
    render :json => entries.to_json(:methods => [:project_guid])
  end

  def tagged
    @tag_name = params[:tag_name].to_s
    @entries = current_user.entries.tagged_with(@tag_name).ordered.paginate :page => params[:page]
    @tags = current_user.entries.tag_counts_on(:tags).order(:name)
    render :index
  end

  private
    def set_entry
      @entry = Entry.find_by_guid!(params[:id])
    end

    def entry_flash entry
      render_to_string :partial => "flash", :locals => { :entry => entry }
    end

end
