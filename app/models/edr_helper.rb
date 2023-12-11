require 'tty-prompt'

class EdrHelper
  CHOICES = ['run an executeable', 'create a file', 'modify a file', 'delete a file', 'transmit data', 'nothing'].freeze

  def auto(fal)
    fal << ProcessController.start_process
    fal << FileController.create('out.txt')
    fal << FileController.modify('out.txt', 'hello world')
    fal << FileController.delete('out.txt')
    fal << NetworkController.transfer_data
    fal.each do |a|
      a.user = ENV["USER"]
      a.process_name = $PROGRAM_NAME
      a.process_id = Process.pid
    end
  end

  def manual(fal)
    puts 'Hello and welcome to the EDR helper!'
    prompt = TTY::Prompt.new
    user = name_prompt(prompt)
    choice = choice_prompt(prompt)

    # do-while loop so that the choices execute at least once
    loop do
      case choice
      when 'run an executeable'
        activity = ProcessController.start_process
      when 'create a file'
        path = path_prompt(prompt, 'create')
        activity = FileController.create(path)
      when 'modify a file'
        path = path_prompt(prompt, 'modify')
        change = change_prompt(prompt)
        activity = FileController.modify(path, change)
      when 'delete a file'
        path = path_prompt(prompt, 'delete')
        activity = FileController.delete(path)
      when 'transmit data'
        activity = NetworkController.transfer_data
      when 'nothing'
        puts 'Have a nice day!'
      else
        puts "sorry I didn't understand that"
        choice = help_prompt(prompt)
        next
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

      choice = help_prompt(prompt)
    end
  end

  private

  # putting prompts in private methods allows us to mock the methods instead of mocking the gem
  def path_prompt(prompt, type)
    prompt.ask("What is the path for the file you want to #{type}?", default: 'out.txt')
  end

  def change_prompt(prompt)
    prompt.ask('What do you want the file to contain?', default: 'hello world')
  end

  def name_prompt(prompt)
    prompt.ask("What is your name?", default: ENV["USER"])
  end

  def choice_prompt(prompt)
    prompt.select("What can I help you with today?", CHOICES)
  end

  def help_prompt(prompt)
    prompt.select("Is there eanything else I can help you with today?", CHOICES)
  end
end