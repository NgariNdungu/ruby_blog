require_relative 'blog'

p "creating blog items"
p b1 = Blog.new("first title", "with some text")
p b2 = Blog.new("2nd title", "with some more")
p b3 = Blog.new("number three", "but of course")

print "\n"
p "adding some comments"
p b1.comments.new("I", "just because")
p b1.comments.new("you", "i asked nicely")
p b3.comments.new("guy", "kai!")

print "\n"
p "retrieving data"
p "First blog"
p "Title: #{b1.title}, text: #{b1.text}"
p "And comments: #{b1.comments}"
