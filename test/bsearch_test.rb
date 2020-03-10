require 'test/unit'
require_relative '../lib/bsearch'

class BsearchTest < Test::Unit::TestCase
  def test_min
    array = (0..5).to_a
    res = bsearch(ng: -1, ok: array.size) do |i|
      array[i] > 3
    end
    assert_equal(res, 4)
  end

  def test_max
    array = (0..5).to_a
    res = bsearch(ng: array.size, ok: -1) do |i|
      array[i] < 3
    end
    assert_equal(res, 2)
  end

  def test_min_nothing_ok
    array = (0..5).to_a
    res = bsearch(ng: -1, ok: array.size) do |i|
      array[i] > 5
    end
    assert_equal(res, array.size)
  end

  def test_max_nothing_ok
    array = (0..5).to_a
    res = bsearch(ng: array.size, ok: -1) do |i|
      array[i] < 0
    end
    assert_equal(res, -1)
  end

  def test_mid1
    array = [4]
    res = bsearch(ng: -1, ok: array.size) do |i|
      array[i] > 3
    end
    assert_equal(res, 0)
  end

  def test_diff1
    array = []
    res = bsearch(ng: -1, ok: array.size) do |i|
      array[i] > 3
    end
    assert_equal(res, 0)
  end
end
