class SearchController < ApplicationController
  def index
    query = params[:term]
    @entries = current_user.entries.skinny.where("search_text ILIKE ?", "%#{query}%")
    respond_to do |format|
      format.html
      format.json {
        render json: @entries.map{ |entry| {
          name: "#{entry.project_name}: #{entry.title}",
          id: entry.guid,
          path: project_entry_path(entry.project, entry)
        }}
      }
    end
  end
end
