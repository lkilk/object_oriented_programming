class Book
  attr_reader :title
  attr_reader :author
  attr_reader :damaged

  def initialize(name, author)
    @title = name
    @author = author
    @damaged = false
  end

  def damaged?
    @damaged = true
  end

end

class Library
  attr_reader :books

   def initialize
      @books = []
   end

   def add_book(book, author)
     Book.new(book, author)
     @books << {title: book, author: author}
   end

   def list_titles_by(author)
     @books.select { |book| book[:author] == author }
   end


end
