require 'test_helper'

class Bar
  include Tagged::Base
end

class TaggingTest < Test::Unit::TestCase
  context "A tagged instance with a custom delimiter" do
    setup do
      Bar.delimiter = '|'
      @bar = Bar.new
      @bar.tag('hoge|fuga|piyo')
    end
    
    should "respond with the correct tags" do
      assert_equal ['hoge', 'fuga', 'piyo'], @bar.tags
    end
    
    should "be able to represent the tags as a string" do
      assert_equal "hoge|fuga|piyo", @bar.tag_list
    end
    
  end
end