class Task < ActiveRecord::Base
  belongs_to :board
  acts_as_list scope: :board
  
  validates :title, :presence => true

  scope :to_do, lambda {where(status: 'To Do')}
  scope :in_progress, lambda {where(status: 'In Progress')}
  scope :complete, lambda {where(status: 'Completed')}
    scope :sorted, lambda {order('tasks.position ASC')}

end
