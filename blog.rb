require_relative 'comment'
class Blog
  attr_accessor :title, :text
  @@instances = []
  def initialize(title, text)
    @title = title
    @text = text
    @comments = BlogComments.new(self)
    @@instances.push self
  end  

  def self.all
    @@instances
  end

  def comments
    @comments
  end

  class BlogComments
    def initialize(blog)
      @blog = blog
      @comments = []
    end

    def new(commenter, body)
      comment = Comment.new(commenter, body, @blog)
      @comments.append(comment)
      return comment
    end

    def inspect
      @comments
    end

    def [](i)
      @comments[i]
    end
  end
end

