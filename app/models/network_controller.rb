require 'socket'

class NetworkController < BaseModel

  # Returns a NetworkActivity object
  def self.transfer_data
    time = Time.now
    sock = TCPSocket.open('www.google.com', 80)
    sock.print "GET / HTTP/1.1\r\n"
    sock.puts "\r\n"
    sock.close_write
    @source = sock.addr
    @dest = sock.peeraddr
    @res =  sock.read

    # We can safely hard code the protocol as http because we hard code it in the socket.
    # The socket doesnt have any fields that I could find where it stored the protocol.
    NetworkActivity.new(time: time, data_amount: @res.size, destination: @dest, source: @source, data_protocol: 'http')
  end

end