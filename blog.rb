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

  def comments
    @comments
  end

  def inspect
    {
    "title": @title,
    "text": @text,
    "comments": @comments.size
    }
  end

  def self.[](i)
    @@instances[i]
  end

  def self.first
    @@instances.first
  end

  def self.last
    @@instances.last
  end
  
  def self.all
    @@instances
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

    def to_s
      @comments.to_s
    end

    def [](i)
      @comments[i]
    end
    
    def size
      @comments.size
    end

    def first
      @comments.first
    end
    
    def last
      @comments.last
    end
  end
end

