json.array! @users do |user|
  json.id user.user_id
  json.name user.user_name
  json.user_sign_in current_user
end