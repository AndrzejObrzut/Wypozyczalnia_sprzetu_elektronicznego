require 'test_helper'

class AnnouncementCategoryTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  def the_count_of_announcment_category
    category = FactoryGirl.create(:announcement_category)

    assert_equal(category.errors.messages, {})
    assert_equal(AnnouncementCategory.count, 1)
  end
end
