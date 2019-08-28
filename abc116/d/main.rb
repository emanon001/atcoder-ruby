class PriorityQueue
  MIN = -(1 << 60)

  attr_reader :size

  def initialize(&block)
    @size = 0
    @heap = Array.new
    @get_key = block || :itself.to_proc
  end

  def empty?
    size == 0
  end

  def pop
    return nil if @size <= 0
    max = @heap[1]
    @heap[1] = @heap[@size]
    @size -= 1
    max_heapify(1)
    max
  end

  def push(x)
    @size += 1
    i = @size
    @heap[i] = x
    while i > 1 && (@get_key.call(@heap[i / 2]) <=> @get_key.call(@heap[i])) < 0
      t = @heap[i / 2]
      @heap[i / 2] = @heap[i]
      @heap[i] = t
      i = i / 2
    end
  end

  def top
    return nil if @size <= 0
    @heap[1]
  end

  def to_a
    return [] if @size == 0
    @heap[1..@size]
  end

  private

  def max_heapify(i)
    l = 2 * i
    r = 2 * i + 1
    largest =
      l <= @size && (@get_key.call(@heap[l]) <=> @get_key.call(@heap[i])) > 0 ? l : i
    largest = r \
      if r <= @size && (@get_key.call(@heap[r]) <=> @get_key.call(@heap[largest])) > 0
    unless largest == i
      t = @heap[i]
      @heap[i] = @heap[largest]
      @heap[largest] = t
      max_heapify(largest)
    end
  end
end

require 'set'
N, K = gets.split.map(&:to_i)
tds = N.times.map { gets.split.map(&:to_i) }

sorted = tds.sort_by { |(t, d)| -d }
tset = Set.new
pq = PriorityQueue.new { |d| -d }
sum = 0
K.times do |i|
  t, d = sorted[i]
  if tset.include?(t)
    pq.push(d)
  else
    tset.add(t)
  end
  sum += d
end
ans = sum + tset.size * tset.size

sorted.drop(K).each do |t, d|
  break if tset.size == K
  next if tset.include?(t)
  tset.add(t)
  d2 = pq.pop
  sum -= (d2 - d)
  n = sum + tset.size * tset.size
  ans = n if n > ans
end

puts ans
