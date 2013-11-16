require 'csv'
require 'thread'

SUM = 20
NUMBER_OF_THREADS = 10
N = 500

def run(n)
  data = [*1..n].map { rand(200) }
  results = []
  0.upto(data.size - 1) do |i|
    k = i + 1
    l = data.size - 1
    while k < l do
      a, b, c = data[i], data[k], data[l]
      results << [a, b, c] if a + b + c == SUM
      k += 1
      l -= 1
    end
  end
  results
end

CSV.open('3sum.csv', 'w') do |csv|
  mutex = Mutex.new
  queue = Queue.new
  5.upto(N) {|i| queue << i * i }

  threads = [*1..NUMBER_OF_THREADS].map do
    Thread.new do
      while !queue.empty? && i = queue.pop()
        start = Time.now
        run(i)
        finish = Time.now
        mutex.synchronize do
          (Math.log(i, 10).floor + 1).times { STDOUT.write "\b" }
          STDOUT.write i
          csv << [i, finish - start]
        end
      end
    end
  end
  threads.each(&:join)
end

STDOUT.write "\n"
