require 'require_all'
require_all 'app'

app = EdrHelper.new
fal = FullActivityLog.new
if ARGV.include?('--manual')
  app.manual(fal)
  fal.output
else
  times = ARGV.include?('--times') ? ARGV.last.to_i : 1
  times.times do
    app.auto(fal)
  end
  fal.output
end