class Post

  attr_accessor :records, :newRecordCount

  def initialize
    self.createDefaultRecords
    self.newRecordCount = 0
  end

  def addRecord(record)
    self.records << record
    self.newRecordCount += 1
  end

  def resetNewRecordCount
    self.newRecordCount = 0
  end

  def createDefaultRecords
    self.records = (1..10).map { |n| {:author => "Author ##{n}", :content => (1..5000).map { ('a'..'z').to_a.push(' ')[rand(27)] }.join} }
  end

end
