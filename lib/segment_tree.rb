class SegmentTree
  def initialize(size, default:, update: :itself.to_proc, merge:)
    n = 1
    while n < size
      n *= 2
    end
    @size = n
    @default = default
    @update_proc = update
    @merge_proc = merge
    @data = Array.new(n * 2 - 1, default)
  end

  # 0-origin
  def update(k, a)
    k += @size - 1
    @data[k] = @update_proc.call(a)
    while k > 0
      k = (k - 1) / 2
      @data[k] = @merge_proc.call(@data[k * 2 + 1], @data[k * 2 + 2])
    end
    nil
  end

  # [a, b)
  # 0-origin
  def query(a, b)
    execute_query(a, b, 0, 0, @size)
  end

  private

  def execute_query(a, b, k, l, r)
    return @default if r <= a || b <= l
    return @data[k] if a <= l && r <= b
    vl = execute_query(a, b, k * 2 + 1, l, (l + r) / 2)
    vr = execute_query(a, b, k * 2 + 2, (l + r) / 2, r)
    @merge_proc.call(vl, vr)
  end
end
