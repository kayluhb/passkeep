module TeamsHelper
  def user_data team
    data = team.users.super_skinny.map{ |user| { :name => user.full_name, :id => user.id } }
    return  data.to_json
  end
end
