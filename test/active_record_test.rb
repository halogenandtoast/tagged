require 'test_helper'
require 'active_record'
require 'tagged/adapters/active_record_adapter'
require 'schema'


class ActiveRecordTest < Test::Unit::TestCase
  context "A Tagged ActiveRecord class" do
    should "respond to tagged class methods" do
      [:delimiter, :delimiter=].each do |method|
        assert Post.respond_to?(method)
      end
    end
  end
  
  context "A Tagged ActiveRecord instance" do
    setup do
      @post = Post.new
    end
    
    should "respond to tagged instance methods" do
      [:tag, :tag_list, :untag].each do |method|
        assert @post.respond_to?(method)
      end
    end
    
    should "respond to taggings" do
      assert @post.respond_to?(:taggings)
    end
    
    should "have no tags to begin with" do
      assert_equal [], @post.tag_list
    end
    
    should "be able to add a tag" do
      @post.tag('foo')
      assert_equal ['foo'], @post.tag_list
    end
    
    should "be able to remove a tag" do
      @post.tag('foo')
      @post.untag('foo')
      assert_equal [], @post.tag_list
    end
    
    should "be able to save tags" do
      @post.tag('foo,bar')
      @post.save
      assert_equal 2, Tag.count
      assert_equal 2, Tagging.count
    end
    
  end
end

