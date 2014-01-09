class TodoListManager
  attr_accessor :todos

  def initialize
    self.load
  end

  def addTodoWithTitle(title)
    self.todos << Todo.new(title)
  end

  # def storageFile
  #   NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0] + '/todos'
  # end

  def load
    # self.todos = NSKeyedUnarchiver.unarchiveObjectWithFile(self.storageFile) || []

    data = NSUserDefaults.standardUserDefaults.objectForKey('todos')
    self.todos = NSKeyedUnarchiver.unarchiveObjectWithData(data) || []
  end

  def save
    # NSKeyedArchiver.archiveRootObject(self.todos, toFile:self.storageFile)

    data = NSKeyedArchiver.archivedDataWithRootObject(self.todos)
    NSUserDefaults.standardUserDefaults.setObject(data, forKey:'todos')
    NSUserDefaults.standardUserDefaults.synchronize
  end
end
