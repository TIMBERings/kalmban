class Board < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  acts_as_list scope: :user

  after_destroy :delete_related_tasks

  validates :title, :presence => true

  scope :open, lambda {where(open: true)}
  scope :closed, lambda {where(open: false)}
  scope :sorted, lambda {order('boards.position ASC')}
  scope :newest_first, lambda { order("boards.created_at DESC")}

private
  def delete_related_tasks
    self.tasks.each do |task|
      task.destroy
    end
  end
end
