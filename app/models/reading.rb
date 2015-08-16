class Reading < ActiveRecord::Base
  belongs_to :user

  default_scope {order('date ASC')}

  scope :before, lambda{|time| where("date < ?" , time) }
  scope :after, lambda{|time| where("date > ?" , time) }

  scope :from_last_day, -> { where(:date => 24.hours.ago..Time.now) }
  scope :from_last_week, -> { where(:date => 1.week.ago..Time.now) }
  scope :from_last_month, -> { where(:date => 1.month.ago..Time.now) }
  scope :from_last_six_months, -> { where(:date => 6.months.ago..Time.now) }
end
