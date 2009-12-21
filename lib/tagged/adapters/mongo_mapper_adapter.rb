require 'tagged'

module Tagged
  
  module MongoMapperExtension
    def self.included(base)
      base.class_eval do
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
      end
    end
  end
end

Tagged::Tag.instance_eval do
  include MongoMapper::Document
  belongs_to :tagged, :polymorphic => true
  key :tagged_type, String
  key :tagged_id, ObjectId
  key :name, String, :required => true
end