module Tagged
  class TagList
    attr_accessor :tags, :delimiter
    def initialize(delimiter)
      self.delimiter = delimiter
      @tags = []
    end
    
    def <<(list)
      @tags += list
    end
    
    def remove(item)
      @tags.delete(item)
    end
    
    def to_s(delimiter = nil)
      @tags.join(delimiter || self.delimiter)
    end
  end
end