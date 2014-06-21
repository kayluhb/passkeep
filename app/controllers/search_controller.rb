class SearchController < ApplicationController

  def index
    query = params[:query]

    projects = current_user.projects.where("projects.name ILIKE ?", "%#{query}%").limit(30)
    entries = current_user.entries.where("search_text ILIKE ?", "%#{query}%").limit(30)

    respond_to do |format|
      format.html

      format.json {

        entry_suggestions = entries.map{ |entry| {
          value: "#{entry.project_name}: #{entry.title}",
          data: project_entry_path(entry.project, entry)
        }}

        project_suggestions = projects.map{ |project| {
          value: "#{project.name}",
          data: project_path(project)
        }}

        suggestions = entry_suggestions + project_suggestions
        suggestions.sort! { |a, b| a[:value].downcase <=> b[:value].downcase }
        render json: { suggestions: suggestions }
      }
    end
  end
end
