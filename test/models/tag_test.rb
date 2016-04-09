require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
    @tag = Tag.new(user_id: 1, name: "a"*100 )
  end
  
  test "should be valid" do
    assert @tag.valid?
  end

  test "name blank should not be valid" do
    @tag.name = " "
    assert_not @tag.valid?
  end

  test "name over maxlength should not be valid" do
    @tag.name = "a" * 101
    assert_not @tag.valid?
  end  
  
  test "user_id blank should not be valid" do
    @tag.user_id = " "
    assert_not @tag.valid?
  end    
end
