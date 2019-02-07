class Blog
  attr_accessor :title, :text
  @@instances = []
  def initialize(title, text, comments=[])
    @title = title
    @text = text
    @comments = comments
    @@instances.push self
  end  

  def self.all
    @@instances
  end

  def comments
    @comments
  end

end

