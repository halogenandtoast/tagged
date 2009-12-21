# require 'test_helper'
# require 'mongo_mapper'
# require 'tagged/adapters/mongo_mapper_adapter'
# require 'mongo_mapper_schema'
# 
# 
# class MongoMapperTest < Test::Unit::TestCase
#   context "A Tagged MongoMapper class" do
#     should "respond to tagged class methods" do
#       [:delimiter, :delimiter=].each do |method|
#         assert Post.respond_to?(method)
#       end
#     end
#   end
#   
#   context "A Tagged MongoMapper instance" do
#     setup do
#       @post = Post.new
#     end
#     
#     should "respond to tagged instance methods" do
#       [:tag, :tags].each do |method|
#         assert @post.respond_to?(method)
#       end
#     end
#     
#     should "respond to taggings" do
#       assert @post.respond_to?(:taggings)
#     end
#     
#     should "have no tags to begin with" do
#       assert_equal [], @post.tags
#     end
#     
#   end
# end

