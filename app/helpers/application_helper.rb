module ApplicationHelper

  def title(page_title)
    return content_for(:title) { "#{page_title.to_s} : Passkeep" } if @company
    content_for(:title) { "#{page_title.to_s} : Passkeep" }
  end

  def on_class path
    ' class=active' if request.fullpath.starts_with? path
  end

end
