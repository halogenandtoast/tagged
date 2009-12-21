require 'test_helper'

class TaggingTest < Test::Unit::TestCase
  context "A tag_list" do
    setup do
      @list = Tagged::TagList.new(',')
    end
    
    should 'be able to add tags with tags#+=' do
      tags = ['foo', 'bar']
      @list.tags += tags
      assert_equal tags, @list.tags
    end
    
    should 'be able to add tags with <<' do
      tags = ['foo', 'bar']
      @list <<  tags
      assert_equal tags, @list.tags
    end
    
    should 'be able to represent the tags in a string' do
      tags = ['foo', 'bar']
      @list.tags += tags
      assert_equal "foo,bar", @list.to_s
    end
    
    should 'be able to remove tags' do
      tags = ['foo', 'bar']
      @list.tags += tags
      @list.remove('foo')
      assert_equal ['bar'], @list.tags
    end
    
  end  
end