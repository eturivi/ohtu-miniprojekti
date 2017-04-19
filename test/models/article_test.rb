require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = articles(:one)
  end

  test "valid new article" do
    assert @article.valid?
  end

  test "invalid new article without author" do
    @article.author = nil
    refute @article.valid?
    assert_not_nil @article.errors[:author]
  end

  test "invalid new article without title" do
    @article.title = nil
    refute @article.valid?
    assert_not_nil @article.errors[:author]
  end

  test "invalid new article without year" do
    @article.year = nil
    refute @article.valid?
    assert_not_nil @article.errors[:author]
  end

end
