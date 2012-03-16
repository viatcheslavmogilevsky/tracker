class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true
  validates :do_before, :presence => true

end
