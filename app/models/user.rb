class User < ActiveRecord::Base
  has_many :readings

  validates :fb_id, uniqueness: true
  validates :meter_id, uniqueness: true

  def get_points
    sums = Reading.sum_over_last_week
    sums.extend(DescriptiveStatistics)
    
    alpha = 200
    beta = 7

    level = sums[self.id]
    rank = 100 - sums.percentile_rank(level)
    baseline = 143

    rank * beta + (baseline - level) / baseline * alpha
  end

  scope :by_fbid, lambda { |fb_id| where(:fb_id => fb_id) } 
end
