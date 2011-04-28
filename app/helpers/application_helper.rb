module ApplicationHelper
  # Return a greeting to logged in users.
  def greeting
    return "" unless user_signed_in?
    logout = link_to "logout", destroy_user_session_path
    "Hello, #{current_user.full_name}! #{logout}".html_safe
  end
  def past str
    "#{str}d"
  end
  def title(page_title)
    content_for(:title) { "#{page_title.to_s} : Passkeep" }
  end
end
