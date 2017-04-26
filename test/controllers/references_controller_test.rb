require 'test_helper'

class ReferencesControllerTest < ActionDispatch::IntegrationTest
  test ".bib file download with one article works properly" do
    expected = <<~END
      @article{ ,
        author = "test user åäö",
        title = "test article",
        journal = "test journal",
        volume = "189",
        year = "2017" }

      END

    get alldownload_path
    assert_equal expected, response.body
    assert_response 200
  end

  test ".bib file download with multiple articles works properly" do
    a = Article.new(author: "a", title: "t", year: -5, journal: "j", volume: -5)
    assert a.save

    expected = <<~END
      @article{ ,
        author = "test user åäö",
        title = "test article",
        journal = "test journal",
        volume = "189",
        year = "2017" }

      @article{ ,
        author = "a",
        title = "t",
        journal = "j",
        volume = "-5",
        year = "-5" }

      END


    get alldownload_path
    binding.pry
    assert_equal expected, response.body
    assert_response 200
  end
end
