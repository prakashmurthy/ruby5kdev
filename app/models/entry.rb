class Entry < ActiveRecord::Base
  validates :distance, :presence => true
  attr_accessible :description, :distance, :location, :time
end
