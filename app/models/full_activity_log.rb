require 'pry'
class FullActivityLog < BaseModel
  attr_accessor :activity

  delegate :<<, to: :activity

  def initialize
    @activity = []
  end

  def output
    puts "{'activity':#{activity.to_json}}"
  end
end