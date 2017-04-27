require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @params = { article: { 'author' => @article.author,
                           'title' => @article.title,
                           'year' => @article.year,
                           'journal' => @article.journal,
                           'volume' => @article.volume } }
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: @params
    end
    assert_redirected_to article_url(Article.last)
  end

  test "should not create article if blank fields" do
    assert_no_difference('Article.count') do
      @params[:article].delete('author')
      post articles_url, params: @params
      assert_select "li", "Author can't be blank"

      @params[:article].delete('title')
      post articles_url, params: @params
      assert_select "li", "Title can't be blank"

      @params[:article].delete('year')
      post articles_url, params: @params
      assert_select "li", "Year can't be blank"
    end
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: @params
    assert_redirected_to article_url(@article)
  end

  test "should not update article if blank fields" do
    patch article_url(@article), params: { article: { author: "",
                                                      title: "",
                                                      year: "" } }
    assert_select "li", "Author can't be blank"
    assert_select "li", "Title can't be blank"
    assert_select "li", "Year can't be blank"
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end

  test "should show article references in human-readable form" do
    get articles_url
    assert_select "td", /^test\ user\ åäö$/
    assert_select "td", /^test\ article$/
    assert_select "td", /^2017$/
    assert_select "td", /^test\ journal$/
    assert_select "td", /^189$/
  end

  test ".bib file download with one article works properly" do
    a = Article.new(author: "aaa", title: "t", year: 1233, journal: "j", volume: -5, key: "aaa12332")
    assert a.save

    expected = <<~END
      @article{aaa12332,
        author = "aaa",
        title = "t",
        year = "1233",
        journal = "j",
        volume = "-5" }
      END

    get article_download_path(a.id)
    assert_equal expected, response.body
    assert_response 200
  end
end
