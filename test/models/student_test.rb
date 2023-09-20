require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "draft returns true for draft student" do
    assert students(:draft).draft?
  end
  test "draft returns false for published student" do
    refute students(:publieshed).draft?
  end
  test "draft returns false for scheduled student" do
    refute students(:scheduled).draft?
  end
  test "publieshed returns true for publieshed student" do
    assert students(:publieshed).publieshed?
  end
  test "publieshed returns false for draft student" do
    refute students(:draft).publieshed?
  end
  test "publieshed returns false for scheduled student" do
    refute students(:scheduled).publieshed?
  end
  test "scheduled returns true for scheduled student" do
    assert students(:scheduled).scheduled?
  end
  test "scheduled returns false for draft student" do
    refute students(:draft).scheduled?
  end
  test "scheduled returns false for scheduled student" do
    refute students(:publieshed).scheduled?
  end
end
