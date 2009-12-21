class Post
  include MongoMapper::Document
  key :title, String
  tagged
end