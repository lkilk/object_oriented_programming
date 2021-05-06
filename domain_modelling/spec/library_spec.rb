require 'library'

describe Book do

  it "has a title & author" do
    book = Book.new("title", "author")
    expect(book.title).to eq("title")
  end

  it "can be recorded as damaged" do
    book = Book.new("title", "author")
    book.damaged?
    expect(book.damaged).to eq true
  end

end

describe Library do

  it "adds a book to the Library" do
    subject.add_book("Dune", "Frank Herbert")
    expect(subject.books).to include(title: "Dune", author: "Frank Herbert")
  end

  it "counts the number of damaged books in the Library" do
    
  end

  it "lists all book titles by author" do
    subject.add_book("Dune", "Frank Herbert")
    expect(subject.list_titles_by("Frank Herbert")).to eq [title: "Dune", author: "Frank Herbert"]
  end

end
