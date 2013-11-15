require 'csv'

def run(data, sum)
  results = []
  0.upto(data.size - 1) do |i|
    k = i + 1
    l = data.size - 1
    while k < l do
      a, b, c = data[i], data[k], data[l]
      results << [a, b, c] if a + b + c == sum
      k += 1
      l -= 1
    end
  end
  results
end

N = 1500

CSV.open('3sum.csv', 'w') do |csv|
  puts "calculating from 5 to #{N}"
  5.upto(N) do |i|
    data = [*1..i].map { rand(200) }
    sum = 20
    start = Time.now
    run(data, sum)
    finish = Time.now
    (Math.log(i, 10).floor + 1).times { STDOUT.write "\b" }
    STDOUT.write i
    csv << [i, finish - start]
  end
end
