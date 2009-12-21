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
      [:tag, :tags].each do |method|
        assert @post.respond_to?(method)
      end
    end
    
    should "respond to taggings" do
      assert @post.respond_to?(:taggings)
    end
    
    should "have no tags to begin with" do
      assert_equal [], @post.tags
    end
    
  end
end

