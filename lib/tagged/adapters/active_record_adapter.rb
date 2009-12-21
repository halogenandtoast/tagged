require 'tagged'

module Tagged
  
  module ActiveRecordExtension
    def self.included(base)
      base.class_eval do
        extend ClassMethods
        include Tagged::Base
      end
    end
    
    module ClassMethods
      def tagged
        self.class_eval do
          has_many :taggings
          has_many :tags, :through => :taggings
        end
      end
    end
  end
  class ActiveRecordAdapter < AbstractAdapter
    
  end
end

ActiveRecord::Base.send(:include, Tagged::ActiveRecordExtension)
