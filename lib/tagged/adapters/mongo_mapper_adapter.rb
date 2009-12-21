module Tagged
  
  module MongoMapperExtension
    def self.included(base)
      base.class_eval do
        class << self
          alias_method :extended_original, :extended
          def extended(model)
            model.class_eval do
              model.send(:include, Tagged::Extension)
              many :tags, :as => :taggable
            end
          end
        end
      end
    end
  end
  class MongoMapperAdapter < AbstractAdapter
    
  end
end

MongoMapper::Document.send(:include, Tagged::MongoMapperExtension)
Tagged::Tag.instance_eval do
  include MongoMapper::Document
  belongs_to :tagged, :polymorphic => true
  key :tagged_type, String
  key :tagged_id, ObjectId
  key :name, String, :required => true
end