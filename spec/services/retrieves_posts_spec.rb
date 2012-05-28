require 'spec_helper'

describe RetrievesPosts do

  subject { RetrievesPosts }

  describe "#all" do

    context "with only published posts" do
      before do
        RetrievesUnpublishedPosts.stub(:all) { [] }
      end

      it "retrieves the published posts" do
        Post.should_receive(:all) { [stub] }
        subject.all
      end

      it "returns the published posts" do
        foo = stub
        Post.stub(:all) { [foo] }
        subject.all.should include(foo)
      end
    end

    context "with only unpublished posts" do
      before do
        Post.stub(:all) { [] }
      end

      it "retrieves the unpublished posts" do
        RetrievesUnpublishedPosts.should_receive(:all) { [stub] }
        subject.all
      end

      it "returns the unpublished posts" do
        foo = stub
        RetrievesUnpublishedPosts.stub(:all) { [foo] }
        subject.all.should include(foo)
      end
    end

    context "with both published and unpublished posts" do

      let(:foo) { stub(title: "foo") }
      let(:bar) { stub(title: "bar") }

      it "removes filesystem posts that have been published" do
        another_bar = stub(title: "bar")

        Post.stub(:all) { [foo, bar] }
        RetrievesUnpublishedPosts.stub(:all) { [another_bar] }

        subject.all.should include(foo, bar)
        subject.all.should_not include(another_bar)
      end

      it "returns the posts" do
        Post.stub(:all) { [bar] }
        RetrievesUnpublishedPosts.stub(:all) { [foo] }

        subject.all.should include(foo, bar)
      end
    end
  end
end
