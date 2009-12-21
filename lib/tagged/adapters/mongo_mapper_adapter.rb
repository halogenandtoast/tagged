require 'tagged'

module Tagged
  
  module MongoMapperExtension
    def self.included(base)
      base.class_eval do
        @@tagged_adapter = MongoMapperAdapter.new
        include Tagged::Base
      end
    end
  end
  class MongoMapperAdapter < AbstractAdapter
    
  end
end

module MongoMapper
  module Document
    module ClassMethods
      def tagged
        include Tagged::MongoMapperExtension
        key :tags, Array
        before_save :save_tags
      end
    end
    
    def save_tags
      self.tags = self.tag_list
    end
  end
end