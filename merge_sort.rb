array = [*1..500**10].shuffle

def merge_sort(array)
  return array if array.length <= 1
  l, r = split_array(array)
  l = merge_sort(l)
  r = merge_sort(r)
  combine(l, r)
end

def combine a, b
  return b.empty? ? a : b if a.empty? || b.empty?
  smallest = a.first <= b.first ? a.shift : b.shift
  combine(a, b).unshift(smallest)
end


def split_array(a)
  middle = a.length / 2
  [a.take(middle), a.drop(middle)]
end

r = merge_sort(array)


