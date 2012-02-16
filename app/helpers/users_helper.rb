module UsersHelper
  def user_edit_title user
    return "Edit #{user.full_name}" unless user.guid == current_user.guid
    "Edit your account"
  end
end
