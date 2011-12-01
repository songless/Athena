class Read < ActiveRecord::Base
  validates :book, :presence => true
  validates :title, :presence => true
end
