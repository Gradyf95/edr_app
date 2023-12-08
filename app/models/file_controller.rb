class FileController < BaseModel

  # Takes in a prompt and returns a FileActivity object
  def self.create(prompt)
    time = Time.now
    path = path_prompt(prompt, 'create')
    success = false
    begin
      file = File.open(path, 'w')
      file.close
      success = true
    rescue Errno::ENOENT
      puts 'I was unable to find that location'
    end

    FileActivity.new(time: time, path: File.expand_path(path), success: success, type: 'create')
  end

  # Takes in a prompt and returns a FileActivity object
  def self.modify(prompt)
    time = Time.now
    path = path_prompt(prompt, 'modify')
    success = false
    if File.exist?(path)
      change = change_prompt(prompt)
      begin
        file = File.open(path, 'r+')
        file.write(change)
        file.close
        success = true
      rescue Errno::ENOENT
        puts 'There was an error modifying the file'
      end
    else
      puts 'I was unable to find that file'
    end

    FileActivity.new(time: time, path: File.expand_path(path), success: success, type: 'modify')
  end

  # Takes in a prompt and returns a FileActivity object
  def self.delete(prompt)
    time = Time.now
    path = path_prompt(prompt, 'delete')
    success = false
    begin
      File.delete(path)
      success = true
    rescue Errno::ENOENT
      puts 'I was unable to find that file'
    end

    FileActivity.new(time: time, path: File.expand_path(path), success: success, type: 'delete')
  end

  private

  # putting prompts in private methods allows us to mock the methods instead of mocking the gem
  def self.path_prompt(prompt, type)
    prompt.ask("What is the path for the file you want to #{type}?")
  end

  def self.change_prompt(prompt)
    prompt.ask('What do you want the file to contain?')
  end
end