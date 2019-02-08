class Comment
  attr_accessor :body
  attr_reader :commenter, :blog
  def initialize(commenter, body, blog)
    set_blog(blog)
    @commenter = commenter
    @body = body
  end  

  def inspect
    {
      "commenter": @commenter,
      "body": @body,
      "blog": @blog.title
    }
  end

  def to_s
    [@commenter, @body, @blog.title].to_s
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
