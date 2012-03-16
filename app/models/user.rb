class User < ActiveRecord::Base

  has_many :tasks

  validates :name, :presence => true, :length => {:maximum => 25}
  validates :email, :presence => true, :format => {:with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                                      :uniqueness => {:case_sensitive => false}
  def no_completed_tasks
    self.tasks.where("complete = ?",false)
  end

  def after_deadline
    self.no_completed_tasks.where("do_before < ?", Date.today )
  end
end
