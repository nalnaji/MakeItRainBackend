class User < ActiveRecord::Base
  has_many :readings

  validates :fb_id, uniqueness: true
  validates :meter_id, uniqueness: true

  def get_points
    10
  end

  scope :by_fbid, lambda { |fb_id| where(:fb_id => fb_id) } 
end
