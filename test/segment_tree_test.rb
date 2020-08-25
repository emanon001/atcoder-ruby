require 'test/unit'
require_relative '../lib/segment_tree'

class SegmentTreeTest < Test::Unit::TestCase
  def test_max
    st = SegmentTree.new(
      3,
      default: -1,
    ) do |a, b|
      [a, b].max
    end
    st.update(0, 1)
    st.update(1, 3)
    st.update(2, 2)

    assert_equal(st.query(0, 1), 1)
    assert_equal(st.query(0, 2), 3)
    assert_equal(st.query(0, 3), 3)

    assert_equal(st.query(1, 2), 3)
    assert_equal(st.query(1, 3), 3)

    assert_equal(st.query(2, 3), 2)
  end
end
