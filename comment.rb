class Comment
  attr_reader :commenter, :body
  def initialize(commenter, body, blog)
    @commenter = commenter
    @body = body
    set_blog(blog)
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
