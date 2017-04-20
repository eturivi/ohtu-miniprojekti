require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "cannot create tag with empty name" do
    assert_no_difference 'Tag.count' do
      Tag.create(name: "")
    end
  end
end
