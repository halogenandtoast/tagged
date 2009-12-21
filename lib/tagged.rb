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
    
    def tag_list
      self._tag_list
    end
    
    def tag_list=(list)
      self._tag_list = Tagged::TagList.new(list.split(delimiter).map(&:strip))
    end
    
    def tag(list)
      list.split(delimiter).map {|tag| self._tag_list << tag.strip }
    end
    
    def untag(items)
      items.split(delimiter).map{|tag| self._tag_list.delete(tag.strip)}
    end
        
    def _tag_list
      @tag_list ||= Tagged::TagList.new([], delimiter)
    end
  end
end

require 'tagged/tag'
require 'tagged/tag_list'
require 'tagged/adapters/abstract_adapter'


