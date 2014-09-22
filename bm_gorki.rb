require 'benchmark'
require './lib/gorki'
require 'securerandom'
require 'redis'

@gorki = Gorki.new('localhost', '9090')
@redis = Redis.new(host: 'localhost', port: '6379')

values = {}
1_000.times do
  values[SecureRandom.hex] = SecureRandom.hex
end

Benchmark.bm do |x|
  x.report("GORKI set:") { values.each { |k, v| @gorki.set(k, v) } }
  x.report("GORKI get:") { values.each { |k, v| puts 'erro' if @gorki.get(k) == '' } }
  x.report("REDIS set:") { values.each { |k, v| @redis.set(k, v) } }
  x.report("REDIS get:") { values.each { |k, v| @redis.get(k) } }
end