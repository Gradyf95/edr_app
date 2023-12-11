require './app/models/edr_helper.rb'
require './app/models/full_activity_log.rb'
require './app/models/file_controller.rb'
require './app/models/network_controller.rb'
require './app/models/process_controller.rb'
require './app/models/file_activity.rb'
require './app/models/network_activity.rb'
require './app/models/process_activity.rb'

describe EdrHelper do
  let(:fal) { FullActivityLog.new }
  let(:process_activity) { ProcessActivity.new }
  let(:network_activity) { NetworkActivity.new }
  let(:create_activity) { FileActivity.new }
  let(:modify_activity) { FileActivity.new }
  let(:delete_activity) { FileActivity.new }

  describe '#manual' do
    let(:prompt) { double('prompt', :ask => 'answer') }

    before do
      allow(TTY::Prompt).to receive(:new).and_return(prompt)
      allow(subject).to receive(:help_prompt).and_return('nothing')
      allow(subject).to receive(:puts)
    end

    describe 'when choice is run an executeable' do
      before do
        allow(subject).to receive(:choice_prompt).and_return('run an executeable')
        allow(ProcessController).to receive(:start_process).and_return(process_activity)
      end

      it 'calls start_process' do
        expect(ProcessController).to receive(:start_process)
        subject.manual(fal)
      end
    end

    describe 'when choice is create a file' do
      before do
        allow(subject).to receive(:choice_prompt).and_return('create a file')
        allow(FileController).to receive(:create).and_return(create_activity)
      end

      it 'calls create' do
        expect(FileController).to receive(:create)
        subject.manual(fal)
      end
    end

    describe 'when choice is modify a file' do
      before do
        allow(subject).to receive(:choice_prompt).and_return('modify a file')
        allow(FileController).to receive(:modify).and_return(modify_activity)
      end

      it 'calls modify' do
        expect(FileController).to receive(:modify)
        subject.manual(fal)
      end
    end

    describe 'when choice is delete a file' do
      before do
        allow(subject).to receive(:choice_prompt).and_return('delete a file')
        allow(FileController).to receive(:delete).and_return(delete_activity)
      end

      it 'calls delete' do
        expect(FileController).to receive(:delete)
        subject.manual(fal)
      end
    end

    describe 'when choice is transfer data' do
      before do
        allow(subject).to receive(:choice_prompt).and_return('transmit data')
        allow(NetworkController).to receive(:transfer_data).and_return(network_activity)
      end

      it 'calls transfer_data' do
        expect(NetworkController).to receive(:transfer_data)
        subject.manual(fal)
      end
    end

    describe 'when choice is nothing' do
      before do
        allow(subject).to receive(:choice_prompt).and_return('nothing')
      end

      it 'outputs Have a nice day!' do
        expect(subject). to receive(:puts).with('Have a nice day!')
        subject.manual(fal)
      end
    end

    describe 'when choice is not recognized' do
      before do
        allow(subject).to receive(:choice_prompt).and_return('gibberish')
      end

      it 'outputs sorry I didnt understand that' do
        expect(subject). to receive(:puts).with("sorry I didn't understand that")
        subject.manual(fal)
      end
    end
  end

  describe '#auto' do
    before do
      allow(ProcessController).to receive(:start_process).and_return(process_activity)
      allow(NetworkController).to receive(:transfer_data).and_return(network_activity)
      allow(FileController).to receive(:create).and_return(create_activity)
      allow(FileController).to receive(:modify).and_return(modify_activity)
      allow(FileController).to receive(:delete).and_return(delete_activity)
    end

    it 'returns an array with updated values' do
      expect(subject.auto(fal).size).to eq(5)
    end
  end
end