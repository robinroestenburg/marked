require 'spec_helper'

describe Post do

  it { should respond_to(:title) }
  it { should respond_to(:author) }
  it { should respond_to(:tags) }
  it { should respond_to(:published_at) }

end
