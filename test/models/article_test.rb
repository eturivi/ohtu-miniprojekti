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
    assert_not_nil @article.errors[:title]
  end

  test "invalid new article without year" do
    @article.year = nil
    refute @article.valid?
    assert_not_nil @article.errors[:year]
  end

  test "invalid new article without journal" do
    @article.journal = nil
    refute @article.valid?
    assert_not_nil @article.errors[:journal]
  end

  test "invalid new article without volume" do
    @article.volume = nil
    refute @article.valid?
    assert_not_nil @article.errors[:volume]
  end

  test "ignores empty tags added via all_tags=" do
    assert_difference 'Tag.count', 1 do
      @article.all_tags = ",,x"
    end
  end
end
