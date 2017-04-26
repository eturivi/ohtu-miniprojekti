require 'test_helper'

class ReferencesControllerTest < ActionDispatch::IntegrationTest
  test ".bib file download with all references works properly" do
    expected = <<~END
      @article{ tes20171,
        author = "test user åäö",
        title = "test article",
        year = "2017",
        journal = "test journal",
        volume = "189" }

      @inproceeding{ 1,
        author = "MyString",
        title = "MyString",
        booktitle = "MyString",
        year = "1",
        editor = "MyString",
        volume = "1",
        series = "MyString",
        pages = "MyString",
        address = "MyString",
        month = "1",
        organization = "MyString",
        publisher = "MyString",
        note = "MyString" }

      END

    get alldownload_path
    assert_equal expected, response.body
    assert_response 200
  end

end
