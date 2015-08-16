collection @users
attributes :id, :name, :email, :fb_id, :meter_id

node :points do |u|
  u.get_points
end
