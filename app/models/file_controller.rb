class FileController < BaseModel

  # Takes in a path and returns a FileActivity object
  def self.create(path)
    time = Time.now
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

  # Takes in a path and a change and returns a FileActivity object
  def self.modify(path, change)
    time = Time.now
    success = false
    if File.exist?(path)
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

  # Takes in a path and returns a FileActivity object
  def self.delete(path)
    time = Time.now
    success = false
    begin
      File.delete(path)
      success = true
    rescue Errno::ENOENT
      puts 'I was unable to find that file'
    end

    FileActivity.new(time: time, path: File.expand_path(path), success: success, type: 'delete')
  end
end