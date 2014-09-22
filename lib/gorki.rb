require 'net/http'

class Gorki
  def initialize(host, port)
    @host = host
    @port = port
  end
  
  def set(key, value)
    Thread.new { Net::HTTP.get(URI("http://#{@host}:#{@port}/set/#{key}/#{value}")) }
    #Net::HTTP.get(URI("http://#{@host}:#{@port}/set/#{key}/#{value}"))
    true
  end
  def get(key)
    Net::HTTP.get(URI("http://#{@host}:#{@port}/get/#{key}"))
  end
end