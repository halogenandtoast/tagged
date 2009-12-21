module Tagged
  
  module Extension
    def self.included(base)
      base.class_eval do
        def self.tagged
          include Tagged::Base
        end
      end
    end
  end
  
  module Base
    
    def self.included(model)
      model.class_eval do
        def self.delimiter
          @@delimiter ||= ','
        end
        
        def self.delimiter=(value)
          @@delimiter = value
        end
      end
    end
    
    def delimiter
      self.class.delimiter
    end
    
    def tags
      _tag_list.tags
    end
    
    def tags=(list)
      _tag_list.tags = list.split(delimiter).map(&:strip)
    end
    
    def tag(list)
      _tag_list << list.split(delimiter).map(&:strip)
    end
    
    def untag(items)
      items.split(delimiter).map{|tag| _tag_list.remove(tag.strip)}
    end
    
    def tag_list(format = nil)
      @tag_list.to_s(format)
    end
    
    def _tag_list
      @tag_list ||= Tagged::TagList.new(delimiter)
    end
  end
end

require 'tagged/tag'
require 'tagged/tag_list'
require 'tagged/adapters/abstract_adapter'


