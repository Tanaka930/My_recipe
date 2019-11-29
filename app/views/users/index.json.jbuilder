json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.icon user.icon
end