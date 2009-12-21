require 'test_helper'

class Foo
  include Tagged::Base
end

class TaggingTest < Test::Unit::TestCase
  context "A tagged instance" do
    setup do
      @foo = Foo.new
      @foo.tag("hoge, fuga, piyo")
    end
    
    should "respond with the correct tags" do
      assert_equal ['hoge', 'fuga', 'piyo'], @foo.tag_list
    end
    
    should "be able to add tags" do
      @foo.tag('osake')
      assert_equal ['hoge', 'fuga', 'piyo', 'osake'], @foo.tag_list
    end
    
    should "be able to remove a tag" do
      @foo.untag('fuga')
      assert_equal ['hoge', 'piyo'], @foo.tag_list
    end
    
    should "be able to remove multiple tags" do
      @foo.untag('hoge, fuga')
      assert_equal ['piyo'], @foo.tag_list
    end
    
    should "be able to represent the tags as a string" do
      assert_equal "hoge,fuga,piyo", @foo.tag_list.to_s
    end
    
    should "be able to represent the tags as a custom string" do
      assert_equal "hoge, fuga, piyo", @foo.tag_list.to_s(', ')
    end
  end  
end