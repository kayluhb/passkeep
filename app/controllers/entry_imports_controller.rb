class EntryImportsController < ApplicationController

  def new
    @entry_import = EntryImport.new
  end

  def create
    @entry_import = EntryImport.new(params[:entry_import])
    if @entry_import.save
      @entry_import.process_import
      redirect_to entries_path, notice: "Yay. Imported!"
    else
      render :new
    end
  end

end
