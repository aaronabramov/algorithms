#     user     system      total        real
# 1.240000   0.000000   1.240000 (  1.245024)
# 2.310000   0.050000   2.360000 (  2.362262)

require 'benchmark'

N = 1_000_000

symbols = %w(a 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0)

Benchmark.bm do |x|
  x.report { N.times { symbols.sample(4).join.to_f } }
  x.report { N.times { Float(symbols.sample(4).join) rescue nil } }
end
