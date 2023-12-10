require 'require_all'
require 'tty-prompt'
require 'pry'
require_all 'app'

# is it helpful to set the process name?
# Process.setproctitle("EDR_helper")

CHOICES = ['run an executeable', 'create a file', 'modify a file', 'delete a file', 'transmit data', 'nothing'].freeze

puts 'Hello and welcome to the EDR helper!'
prompt = TTY::Prompt.new
fal = FullActivityLog.new
user = prompt.ask("What is your name?", default: ENV["USER"])
choice = prompt.select("What can I help you with today?", CHOICES)

# do-while loop so that the choices execute at least once
loop do
  case choice
  when 'run an executeable'
    activity = ProcessController.start_process
  when 'create a file'
    activity = FileController.create(prompt)
  when 'modify a file'
    activity = FileController.modify(prompt)
  when 'delete a file'
    activity = FileController.delete(prompt)
  when 'transmit data'
    activity = NetworkController.transfer_data
  when 'nothing'
    puts 'Have a nice day!'
  else
    puts "sorry I didn't understand that"
    # TODO handle edge cases and reset prompt
  end

  if choice == 'nothing'
    break
  end
   
  # TODO figure out process name and process command line
  # `ps -eo "%p|$|%a" | grep '^\\s*#{Process.pid}'`.strip.split("|$|")[1]
  activity.user = user
  activity.process_name = $PROGRAM_NAME
  activity.process_id = Process.pid
  fal << activity

  choice = prompt.select("Is there eanything else I can help you with today?", CHOICES)
end

fal.output