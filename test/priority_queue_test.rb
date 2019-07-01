require 'test/unit'
require_relative '../lib/priority_queue'

class PriorityQueueTest < Test::Unit::TestCase
  def test_no_block
    pq = PriorityQueue.new
    pq.push(1)
    pq.push(3)
    pq.push(2)
    assert_equal(pq.size, 3)
    assert_equal(pq.top, 3)
    assert_equal(pq.pop, 3)
    assert_equal(pq.size, 2)
    assert_equal(pq.top, 2)
    assert_equal(pq.pop, 2)
    assert_equal(pq.size, 1)
    assert_equal(pq.top, 1)
    assert_equal(pq.pop, 1)
    assert_equal(pq.size, 0)
    assert_equal(pq.top, nil)
    assert_equal(pq.pop, nil)
  end

  def test_block_given
    pq = PriorityQueue.new { |x| -x }
    pq.push(1)
    pq.push(3)
    pq.push(2)
    assert_equal(pq.size, 3)
    assert_equal(pq.top, 1)
    assert_equal(pq.pop, 1)
    assert_equal(pq.size, 2)
    assert_equal(pq.top, 2)
    assert_equal(pq.pop, 2)
    assert_equal(pq.size, 1)
    assert_equal(pq.top, 3)
    assert_equal(pq.pop, 3)
    assert_equal(pq.size, 0)
    assert_equal(pq.top, nil)
    assert_equal(pq.pop, nil)
  end

  def test_empty?
    pq = PriorityQueue.new
    assert_equal(pq.empty?, true)
    pq.push(1)
    assert_equal(pq.empty?, false)
    pq.pop
    assert_equal(pq.empty?, true)
  end
end
