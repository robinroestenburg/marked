require 'spec_helper'

describe RetrievesUnpublishedPosts do

  subject { RetrievesUnpublishedPosts }

  describe "#all" do

    context "with no unpublished posts" do

      it "returns an empty array" do
        Dir.stub(:new) { [".", ".."] }
        subject.all.should be_empty
      end

    end

    context "with unpublished posts" do

      it "retrieves all posts from the file system" do
        Dir.should_receive(:glob) { ["foo"] }
        subject.all
      end

      it "returns an in-memory Post for each post" do
        foo = stub
        Dir.stub(:glob) { ["foo"] }
        Post.should_receive(:new).with({ title: "foo" }) { foo }

        subject.all.first.should == foo
      end
    end
  end
end
