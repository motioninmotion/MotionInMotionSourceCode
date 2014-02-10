describe 'Post' do

  before do
    include CDQ
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Post entity'
    Post.entity_description.name.should == 'Post'
  end
end
