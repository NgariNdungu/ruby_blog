# build a blog console application and make the tests pass
# Have one file for the app (app.rb), 
# one file fo the runner (main.rb) 
# and this test file (test_blog.rb).
# when you run 

# ruby ./main.rb

# it should run the test and pass
  
require "minitest/autorun"

class TestBlogApp < Minitest::Test
  def setup
    @blog = Blog.new(name: 'The best Blog')
  end

  def test_new_blog
    refute_nil @blog.id, 'id is initialized automatically'
    refute_nil @blog.name
    assert_equal @blog.articles, [] 
    @blog.name = 'New Name'
    assert_equal @blog.name, 'New Name', 'Can edit field'
    assert_raises NoMethodError, 'id cannot be assigned' do
      @blog.id = SecureRandom.uuid
    end   
  end
  
  def test_new_article
    title = 'Arcticle 1'
    body = 'Article 1 body'
    article_1 = @blog.new_article(title: title, body: body)
    refute_nil article_1.id, 'id is initialized automatically'
    refute_nil article_1.title
    refute_nil article_1.body
    assert_equal article_1.comments, []
    article_1.title = 'New Title'
    assert_equal article_1.title, 'New Title', 'Can edit field'
    article_1.body = 'New Body'
    assert_equal article_1.body, 'New Body', 'Can edit field'
    assert_raises NoMethodError, 'id cannot be assigned' do
      article_1.id = SecureRandom.uuid
    end
  end

  def test_articles_array
    2.times do
      @blog.new_article(title:'Article', body: 'Article body')
    end
    assert_equal @blog.articles.size, 2
  end

  def test_new_comments
    article = @blog.new_article(title:'Article', body: 'Article body')
    comment = article.new_comment(body: 'This is great')
    refute_nil comment.id, 'id is initialized automatically'
    refute_nil comment.body
    comment.body = 'New Body'
    assert_equal comment.body, 'New Body', 'Can edit field'
    assert_raises NoMethodError, 'id cannot be assigned' do
      comment.id = SecureRandom.uuid
    end
  end

  def test_comments_array
    article = @blog.new_article(title:'Article', body: 'Article body')
    2.times do
      article.new_comment(body: 'This is great')
    end
    assert_equal article.comments.size, 2
  end
end
