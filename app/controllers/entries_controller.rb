class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      redirect_to(@entry, :notice => render_to_string(:partial => "flash"))
    else
      flash.now[:notice] = "Couldn't save. Please check your form and submit it again!"
      render :new
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      redirect_to(entries_path, :notice => render_to_string(:partial => "flash"))
    else
      flash.now[:error] = "Could not save. Please check the form and try again."
      render :edit
    end
  end

  def confirm
    @entry = Entry.find(params[:id])
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to(entries_path, :notice => "Awesome. You deleted #{@entry.name}")
  end

end