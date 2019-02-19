class Blog
  attr_reader :id, :articles
  attr_accessor :name
  @@id = 0
  def initialize(name)
    @name = name
    @id = set_id
    @articles = []
  end

  def set_id
    @@id += 1
  end

  def new_article(title: nil, body: nil)
    article = Article.new(title, body)
    @articles.push(article)
    return article
  end

end

class Article
  attr_reader :id, :comments
  attr_accessor :title, :body
  @@id = 0
  def initialize(title, body)
    @title = title
    @body = body
    @id = set_id
    @comments = []
  end

  def set_id
    @@id += 1
  end

  def new_comment(body: nil)
    comment = Comment.new(body)
    comments << comment
    return comment
  end
end

class Comment
  attr_reader :id
  attr_accessor :body
  @@id = 0
  def initialize(body)
    @body = body
    @id = set_id
  end

  def set_id
    @@id += 1
  end
end
