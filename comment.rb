class Comment
  attr_reader :commenter, :body, :blog
  def initialize(commenter, body, blog)
    set_blog(blog)
    @commenter = commenter
    @body = body
  end  

  def inspect
    [@commenter, @body, @blog.title]
  end
  private
  def set_blog(blog)
    if blog.instance_of? Blog
      @blog = blog
    else
      raise TypeError, "Expected a blog object"
    end
  end
end
