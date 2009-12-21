module Tagged
  class TagList < Array
    attr_accessor :tags, :delimiter
    def initialize(*list)
      self.delimiter = ','
      if list[0].is_a?(Array)
        self.delimiter = list[1]
        list = list[0]
      end
      list = list.is_a?(Array) ? list : list.split(self.delimiter).collect(&:strip).reject(&:blank)
      super(list)
    end
    
    def +(list)
      Tagged::TagList.new(self.to_a + list, self.delimiter)
    end
    
    def to_s(delimiter = nil)
      join(delimiter || self.delimiter)
    end
  end
end