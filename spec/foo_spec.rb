require 'spec_helper'
require 'foo'

describe Foo do

  it "returns true" do
    subject.bar.should == true
  end

end
