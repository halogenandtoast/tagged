module Tagged
  
  module ActiveRecordExtension
    def self.included(base)
      base.send(:include, Tagged::Extension)
      base.class_eval do
        has_many :taggings
        has_many :tags, :through => :taggings
      end
    end
  end
  class ActiveRecordAdapter < AbstractAdapter
    
  end
end

ActiveRecord::Base.send(:include, Tagged::ActiveRecordExtension)
