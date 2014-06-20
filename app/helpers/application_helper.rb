module ApplicationHelper

  # Meta tag helpers
  def default_title
    "Passkeep"
  end

  def title(page_title)
    content_for(:title) { "#{page_title.to_s} : #{default_title}" }
  end

  def on_class(path)
    return 'on' if request.fullpath.starts_with? path
    ''
  end

  # Text helpers
  def external_link(url, text="")

    return "" if url.blank?

    if text == ""
      text = url.gsub('http://', '').gsub('https://', '').gsub('www.', '')
    end

    url = "http://#{url}" if url.index("http").blank?

    return "<a href='#{url}' class='external' title='#{url}'>#{text}</a>".html_safe
  end
end
