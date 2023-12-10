require './app/models/network_controller.rb'
require './app/models/network_activity.rb'

describe NetworkController do
  let(:time) { Time.now }
  let(:sock) { double('sock') }
  let(:addr) { 'addr' }
  let(:peeraddr) { 'peeraddr' }
  let(:response) { 'response' }

  before do
    allow(TCPSocket).to receive(:open).with('www.google.com', 80).and_return(sock)
    allow(sock).to receive(:print)
    allow(sock).to receive(:puts)
    allow(sock).to receive(:close_write)
    allow(sock).to receive(:addr).and_return(addr)
    allow(sock).to receive(:peeraddr).and_return(peeraddr)
    allow(sock).to receive(:read).and_return(response)
  end

  it 'returns a NetworkActivity object with the correct values' do
    network_activity = described_class.transfer_data
    expect(network_activity).to be_a NetworkActivity
    expect(network_activity.destination).to eq(peeraddr)
    expect(network_activity.source).to eq(addr)
    expect(network_activity.data_amount).to eq(response.size)
  end
end