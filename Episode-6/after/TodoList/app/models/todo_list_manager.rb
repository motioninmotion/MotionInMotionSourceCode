class TodoListManager
  attr_accessor :todos

  def initialize
    self.load
  end

  def addTodoWithTitle(title)
    self.todos << Todo.new(title)
  end

  def load
    self.todos = []
  end

  def save
  end
end
