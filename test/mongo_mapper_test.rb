require 'test_helper'
require 'mongo_mapper'
require 'tagged/adapters/mongo_mapper_adapter'
require 'mongo_mapper_schema'


class MongoMapperTest < Test::Unit::TestCase
  context "A Tagged MongoMapper class" do
    should "respond to tagged class methods" do
      [:delimiter, :delimiter=].each do |method|
        assert Article.respond_to?(method)
      end
    end
  end
  
  context "A Tagged MongoMapper instance" do
    setup do
      @article = Article.new
    end
    
    should "respond to tagged instance methods" do
      [:tag, :tag_list, :untag].each do |method|
        assert @article.respond_to?(method)
      end
    end
    
    should "have no tags to begin with" do
      assert_equal [], @article.tag_list
    end
    
    should "be able to add a tag" do
      @article.tag('foo')
      assert_equal ['foo'], @article.tag_list
    end
    
    should "be able to remove a tag" do
      @article.tag('foo')
      @article.untag('foo')
      assert_equal [], @article.tag_list
    end
    
  end
end

