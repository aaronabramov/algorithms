require 'benchmark'

array = [*0..100**3].shuffle

def split_array(a)
  middle = a.length / 2
  [a.take(middle), a.drop(middle)]
end

def merge_sort(array)
  return array if array.length <= 1
  l, r = split_array(array)
  l = merge_sort(l)
  r = merge_sort(r)
  combine(l, r)
end

# Recursion combine. causes stack overflow on large arrays
# def combine(a, b)
#   return a.empty? ? b : a if a.empty? || b.empty?
#   smallest = a.first < b.first ? a.shift : b.shift
#   combine(a, b).unshift(smallest)
# end

def combine(a, b)
  result = []

  until a.empty? or b.empty?
    smallest = a.first < b.first ? a.shift : b.shift
    result << smallest
  end

  result.concat(a).concat(b)
end

STDOUT.write Benchmark.measure { merge_sort(array) }
