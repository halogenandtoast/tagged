require 'tagged'

module Tagged
  
  module ActiveRecordExtension
    def self.included(base)
      base.class_eval do
        @@tagged_adapter = ActiveRecordAdapter.new
        extend ClassMethods
        include Tagged::Base
      end
    end
    
    module ClassMethods
      def tagged
        self.class_eval do
          has_many :taggings, :as => :tagged, :dependent => :destroy
          has_many :tags, :through => :taggings
          after_save :save_tags
        end
      end
    end
    
    def save_tags
      tag_list.each do |tag_name|
        tags << ::Tag.find_or_initialize_by_name(tag_name) 
      end
    end
  end
  class ActiveRecordAdapter < AbstractAdapter
    
  end
end

ActiveRecord::Base.send(:include, Tagged::ActiveRecordExtension)
