require 'spec_helper'

describe Gorki do
  
  before :each do
    @g = Gorki.new('localhost', '9090')
  end
  
  it "verify if it's returning what's set" do
    @g.set('hugo', 'testeee')
    @g.get('hugo').should eql 'testeee'
  end
  
end