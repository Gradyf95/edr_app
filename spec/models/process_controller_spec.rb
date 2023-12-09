require './app/models/process_controller.rb'
require './app/models/process_activity.rb'

describe ProcessController do
  let(:time) { Time.now }
  let(:prompt) { double('prompt') }
  let(:io) { double('io') }

  before do
    allow(IO).to receive(:popen).with('ruby test.rb').and_return(io)
    allow(io).to receive(:read).and_return('hello world')
    # this stops hello world from being output in our rspec output
    allow($stdout).to receive(:<<)
  end

  it 'outputs to stdout' do
    expect{ described_class.start_process(prompt) }.to output(a_string_including('hello world')).to_stdout
  end

  it 'returns a ProcessActivity object' do
    expect(described_class.start_process(prompt)).to be_a ProcessActivity
  end
end