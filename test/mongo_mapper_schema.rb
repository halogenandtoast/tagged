MongoMapper.connection = Mongo::Connection.new('127.0.0.1')
MongoMapper.database = "testing_tagged"

class Article
  include MongoMapper::Document
  key :title, String
  tagged
end