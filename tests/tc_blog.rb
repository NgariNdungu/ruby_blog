require 'blog'
require 'test/unit'

class TestBlog < Test::Unit::TestCase
  def setup
    @blog = Blog.new("title", "text")
  end

  def test_can_create_blog
    assert_nothing_raised(StandardError) do
      Blog.new("Title", "text")
    end
  end

  def test_can_retrieve_content
    blog = Blog.new("Title", "text")
    assert_equal "Title", blog.title
    assert_equal "text", blog.text
  end

  def test_can_update_content
    title = "some other title"
    text = "a bit more text"
    @blog.title = title
    @blog.text = text
    assert_equal title, @blog.title
    assert_equal text, @blog.text
  end

  def test_blog_has_comments
    assert false, "Blog doesn't support comments"
  end
end
