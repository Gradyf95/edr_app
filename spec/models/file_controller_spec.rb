require './app/models/file_controller.rb'
require './app/models/file_activity.rb'

describe FileController do
  let(:path) { '/path/to/file' }
  let(:time) { Time.now }
  let(:file) { double('file') }

  before do
    allow(File).to receive(:expand_path).and_return(path)
    allow(Time).to receive(:now).and_return(time)
  end

  describe '#create' do
    describe 'when a valid path is provided' do
      let(:new_params) { { time: time, path: path, success: true, type: 'create' } }

      before do
        allow(File).to receive(:open).with(path, 'w').and_return(file)
        allow(file).to receive(:close)
      end

      it 'creates the file' do
        expect(FileActivity).to receive(:new).with(new_params)
        described_class.create(path)
      end
    end

    describe 'when an invalid path is provided' do
      before do
        allow(File).to receive(:open).with(path, 'w').and_raise(Errno::ENOENT)
      end

      it 'outputs an error' do
        expect{ described_class.create(path) }.to output(a_string_including("I was unable to find that location")).to_stdout
      end
    end
  end

  describe '#modify' do
    describe 'when a valid path is provided' do
      let(:new_params) { { time: time, path: path, success: true, type: 'modify' } }
      let(:change) { 'change' }

      before do
        allow(File).to receive(:exist?).with(path).and_return(true)
        allow(File).to receive(:open).with(path, 'r+').and_return(file)
        allow(file).to receive(:close)
      end

      describe 'when modification is successful' do
        before do
          allow(file).to receive(:write).with(change)
        end

        it 'modifies the file' do
          expect(FileActivity).to receive(:new).with(new_params)
          described_class.modify(path, change)
        end
      end

      describe 'when modification is unsuccessful' do
        before do
          allow(file).to receive(:write).with(change).and_raise(Errno::ENOENT)
        end

        it 'outputs an error' do
          expect{ described_class.modify(path,change) }.to output(a_string_including("There was an error modifying the file")).to_stdout
        end
      end
    end

    # This test is causing some warnings about gem versions being out of date.
    describe 'when an invalid path is provided' do
      before do
        allow(File).to receive(:exist?).and_return(false)
      end

      it 'outputs an error' do
        expect{ described_class.modify(path, change) }.to output(a_string_including("I was unable to find that file")).to_stdout
      end
    end
  end

  describe '#delete' do
    describe 'when a valid path is provided' do
      let(:new_params) { { time: time, path: path, success: true, type: 'delete' } }

      before do
        allow(File).to receive(:delete).with(path)
      end

      it 'deletes the file' do
        expect(FileActivity).to receive(:new).with(new_params)
        described_class.delete(path)
      end
    end

    describe 'when an invalid path is provided' do
      before do
        allow(File).to receive(:delete).with(path).and_raise(Errno::ENOENT)
      end

      it 'outputs an error' do
        expect{ described_class.delete(path) }.to output(a_string_including("I was unable to find that file")).to_stdout
      end
    end
  end
end