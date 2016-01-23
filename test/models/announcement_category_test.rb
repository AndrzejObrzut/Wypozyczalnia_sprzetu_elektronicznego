require 'test_helper'

class AnnouncementCategoryTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  def the_count_of_announcment_category
    category = AnnouncementCategory.new(name: "Category_name",
                                        image: 100101010101010101,
                                        filename: "Category_name.png",
                                        mime_type: "image/png",
                                        size: 108)

    category.save

    assert_equal(category.errors.messages, {})
    assert_equal(AnnouncementCategory.count, 1)
  end
end
