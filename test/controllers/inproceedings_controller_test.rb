require 'test_helper'

class InproceedingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inproceeding = inproceedings(:one)
    @params = { inproceeding: { 'author' => @inproceeding.author,
                                'title' => @inproceeding.title,
                                'year' => @inproceeding.year,
                                'booktitle' => @inproceeding.booktitle } }
  end

  test "should get index" do
    get inproceedings_url
    assert_response :success
  end

  test "should get new" do
    get new_inproceeding_url
    assert_response :success
  end

  test "should create inproceeding" do
    assert_difference('Inproceeding.count') do
      post inproceedings_url, params: @params
    end
    assert_redirected_to inproceeding_url(Inproceeding.last)
  end

  test "should not create inproceeding if blank fields" do
    assert_no_difference('Inproceeding.count') do
      @params[:inproceeding].delete('author')
      post inproceedings_url, params: @params
      assert_select "li", "Author can't be blank"

      @params[:inproceeding].delete('title')
      post inproceedings_url, params: @params
      assert_select "li", "Title can't be blank"

      @params[:inproceeding].delete('year')
      post inproceedings_url, params: @params
      assert_select "li", "Year can't be blank"
    end
  end

  test "should show inproceeding" do
    get inproceeding_url(@inproceeding)
    assert_response :success
  end

  test "should get edit" do
    get edit_inproceeding_url(@inproceeding)
    assert_response :success
  end

  test "should update inproceeding" do
    patch inproceeding_url(@inproceeding), params: { inproceeding: { address: @inproceeding.address, author: @inproceeding.author, booktitle: @inproceeding.booktitle, editor: @inproceeding.editor, key: @inproceeding.key, month: @inproceeding.month, note: @inproceeding.note, organization: @inproceeding.organization, pages: @inproceeding.pages, publisher: @inproceeding.publisher, series: @inproceeding.series, title: @inproceeding.title, volume: @inproceeding.volume, year: @inproceeding.year } }
    assert_redirected_to inproceeding_url(@inproceeding)
  end

  test "should not update inproceeding if blank fields" do
    patch inproceeding_url(@inproceeding), params: { inproceeding: { author: "",
                                                      title: "",
                                                      booktitle: "",
                                                      year: "" } }
    assert_select "li", "Author can't be blank"
    assert_select "li", "Title can't be blank"
    assert_select "li", "Booktitle can't be blank"
    assert_select "li", "Year can't be blank"
  end

  test "should destroy inproceeding" do
    assert_difference('Inproceeding.count', -1) do
      delete inproceeding_url(@inproceeding)
    end

    assert_redirected_to inproceedings_url
  end

  test ".bib file download with one inproceeding works properly" do
    a = Inproceeding.new(author: "aaa", title: "t", booktitle: "yyy", year: 1233, key: "aaa12332")
    assert a.save

    expected = <<~END
      @inproceeding{aaa12332,
        author = "aaa",
        title = "t",
        booktitle = "yyy",
        year = "1233" }
      END

    get inproc_download_path(a.id)
    assert_equal expected, response.body
    assert_response 200
  end
end
