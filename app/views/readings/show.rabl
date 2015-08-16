object @reading
attributes :id, :user_id, :date, :reading_cf

node :points do |u|
  u.get_points
end
