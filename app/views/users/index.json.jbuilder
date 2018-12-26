json.array! @users do |user|
  json.id user.id
  json.title user.title
  json.update_url user_path(user, method: :patch)
  json.edit_url edit_user_path(user)
end
