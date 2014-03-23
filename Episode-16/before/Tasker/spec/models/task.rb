describe 'Task' do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Task entity' do
    Task.entity_description.name.should == 'Task'
  end
end
