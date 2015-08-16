class User < ActiveRecord::Base
  has_many :readings

  def get_points
    10
  end
end
