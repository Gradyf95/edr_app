require './app/models/process_controller.rb'
require './app/models/process_activity.rb'

describe ProcessController do
  let(:time) { Time.now }
  let(:io) { double('io', :read => 'hello world') }

  before do
    allow(IO).to receive(:popen).with('ruby test.rb').and_return(io)
    # this stops hello world from being output in our rspec output
    allow($stdout).to receive(:<<)
  end

  it 'outputs to stdout' do
    expect{ described_class.start_process }.to output(a_string_including('hello world')).to_stdout
  end

  it 'returns a ProcessActivity object' do
    expect(described_class.start_process).to be_a ProcessActivity
  end
end