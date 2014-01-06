describe 'Pseudonym' do

  before do
    include CDQ
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Pseudonym entity'
    Pseudonym.entity_description.name.should == 'Pseudonym'
  end
end
