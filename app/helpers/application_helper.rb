module ApplicationHelper

  def title(page_title)
    return content_for(:title) { "#{page_title.to_s} : Passkeep" } if @company
    content_for(:title) { "#{page_title.to_s} : Passkeep" }
  end

  def meta_description(description)
    content_for(:meta_description) { "#{description.to_s}" }
  end

  def on_class path
    'on' if request.fullpath.starts_with? path
  end

  def on_class_home path
    'on' if request.fullpath == path
  end

end
