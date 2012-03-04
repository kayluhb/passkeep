module TeamsHelper

  def team_remove_link team, user
    return '' if team.master && user.super_user
    '<a class="close" title="remove">&times;</a>'.html_safe
  end

end