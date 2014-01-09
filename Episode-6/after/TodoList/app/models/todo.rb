class Todo
  attr_accessor :title, :completed

  def initialize(title, completed = false)
    self.title = title
    self.completed = completed
  end

  def initWithCoder(decoder)
    self.title = decoder.decodeObjectForKey('title')
    self.completed = decoder.decodeBoolForKey('completed')
    self
  end

  def encodeWithCoder(encoder)
    encoder.encodeObject(self.title, forKey:'title')
    encoder.encodeBool(self.completed, forKey:'completed')
  end
end
