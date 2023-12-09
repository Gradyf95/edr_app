class ProcessController < BaseModel

  # Takes in a prompt and returns a ProcessActivity object
  def self.start_process(prompt)
    time = Time.now
    io = IO.popen('ruby test.rb')
    $stdout << io.read
    
    ProcessActivity.new(time: time)
  end
end