RSpec.describe "gem-list" do
  let(:pry) { Pry.new }

  it 'should work arglessly' do
    list = pry_eval('gem-list')
    expect(list).to match(/rspec \(/)
  end

  it 'should find arg' do
    prylist = pry_eval('gem-list rspec')
    expect(prylist).to match(/rspec-core \(/)
  end

  it 'should return non-results as silence' do
    expect(pry_eval('gem-list aoeuoueouaou')).to be_empty
  end
end
