class ProcessController < BaseModel

  # Returns a ProcessActivity object
  def self.start_process
    time = Time.now
    io = IO.popen('ruby test.rb')
    $stdout << io.read
    
    ProcessActivity.new(time: time)
  end
end