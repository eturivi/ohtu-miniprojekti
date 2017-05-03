require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @params = { book: { 'author' => @book.author,
                           'title' => @book.title,
                           'year' => @book.year,
                           'publisher' => @book.publisher } }
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: @params
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should not create book if blank fields" do
    assert_no_difference('Book.count') do
      @params[:book].delete('author')
      post books_url, params: @params
      assert_select "li", "Author can't be blank"

      @params[:book].delete('title')
      post books_url, params: @params
      assert_select "li", "Title can't be blank"

      @params[:book].delete('year')
      post books_url, params: @params
      assert_select "li", "Year can't be blank"
    end
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { address: @book.address, author: @book.author, edition: @book.edition, key: @book.key, month: @book.month, note: @book.note, publisher: @book.publisher, series: @book.series, title: @book.title, volume: @book.volume, year: @book.year } }
    assert_redirected_to book_url(@book)
  end

  test "should not update book if blank fields" do
    patch book_url(@book), params: { book: { author: "",
                                              title: "",
                                              publisher: "",
                                              year: "" } }
    assert_select "li", "Author can't be blank"
    assert_select "li", "Title can't be blank"
    assert_select "li", "Publisher can't be blank"
    assert_select "li", "Year can't be blank"
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end

  test ".bib file download with one book works properly" do
    a = Book.new(author: "aaa", title: "t", publisher: "yyy", year: 1233, key: "aaa12332")
    assert a.save

    expected = <<~END
      @book{aaa12332,
        author = "aaa",
        title = "t",
        publisher = "yyy",
        year = "1233" }
      END

    get book_download_path(a.id)
    assert_equal expected, response.body
    assert_response 200
  end
end
