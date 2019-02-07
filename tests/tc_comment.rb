require 'comment'
require 'test/unit'

class TestComment < Test::Unit::TestCase
  def setup
    @blog = Blog.new("Title", "text")
  end

  def test_does_not_create_comment_if_not_instance_of_blog
    assert_raises(TypeError) do
      Comment.new("me", "some body", "blog")
    end
  end

  def test_can_create_comment 
    assert_nothing_raised(StandardError) do
      Comment.new("me", "some body", @blog)
    end
  end

  def test_can_retrieve_comment_content
    comment = Comment.new("me", "some body", @blog)
    assert_equal "me", comment.commenter
    assert_equal "some body", comment.body
  end

end
