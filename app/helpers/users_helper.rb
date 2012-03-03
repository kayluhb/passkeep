module UsersHelper

  def last_sign_in user
    user.current_sign_in_at.blank? ? "Never signed in" : l(user.current_sign_in_at)
  end

  def user_edit_title user
    return "Edit #{user.full_name}" unless user.guid == current_user.guid
    "Edit your account"
  end
end
