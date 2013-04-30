class Comment < ActiveRecord::Base
  belongs_to :user
  validates :text, :presence => true
  attr_accessible :text, :entry, :user
end
