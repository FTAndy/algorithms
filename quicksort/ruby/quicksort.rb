require "minitest/autorun"
require "faker"

module Quicksort
  def exange(array, i, j)
    tem = array[i]
    array[i] = array[j]
    array[j] = tem
  end

  def quicksort(array, lo, hi)
    return if (hi <= lo)
    parti = partition(array, lo, hi)
    quicksort(array, lo, parti -1)
    quicksort(array, parti + 1, hi)
  end

  def partition(array, lo, hi)
    i = lo
    j = hi + 1
    loop do
      while true
        if (array[i += 1] > array[lo]) ||  (i == hi)
          break
        end
      end
      while true
        if (array[j -= 1] < array[lo]) || (j == lo)
          break
        end
      end
      if j <= i
        exange(array, lo, j)
        return j
      end
      exange(array, i, j)
    end
  end
end

class QuicksortTest < Minitest::Test
  include Quicksort
  def setup
    @a = Faker::Number.number(10).split("")
    @b = @a
  end

  def test_quicksort
    quicksort(@a, 0, @a.size-1)
    assert_equal @b.sort, @a
  end
end
