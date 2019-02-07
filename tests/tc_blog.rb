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
    assert_equal "title", @blog.title
    assert_equal "text", @blog.text
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
    assert_respond_to @blog, :comments, "Comments not supported"

    assert_instance_of Array, @blog.comments
    assert_instance_of Comment, @blog.comments[0]
  end

  def test_can_create_comment_from_blog
    assert_respond_to @blog.comments, :new
  end

  def test_can_retrieve_blogs
    assert_respond_to(Blog, :all, "Blog doesn't have an :all method")
    
    assert Blog.all.instance_of? Array
    assert_instance_of Blog, Blog.all[0], "Did not return blogs"
  end
end
