class Todo
  attr_accessor :title, :completed

  def initialize(title, completed = false)
    self.title = title
    self.completed = completed
  end
end
