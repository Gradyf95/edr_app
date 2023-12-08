require './app/models/file_controller.rb'

describe FileController do
  let(:path) { '/path/to/file' }

  before do
    allow(FileController).to receive(:path_prompt).and_return(path)
    allow(File).to receive(:expand_path).and_return(path)
  end

  describe '#create' do
    describe 'when a valid path is provided' do
      it 'creates the file' do
        
      end
    end

    describe 'when an invalid path is provided' do
      it 'outputs an error' do

      end
    end
  end

  describe '#modify' do
    describe 'when a valid path is provided' do
      describe 'when modification is successful' do
        it 'modifies the file' do

        end
      end
      describe 'when modification is unsuccessful' do
        it 'outputs an error' do

        end
      end
    end

    describe 'when an invalid path is provided' do
      it 'outputs an error' do

      end
    end
  end

  describe '#delete' do
    describe 'when a valid path is provided' do
      it 'deletes the file' do

      end
    end

    describe 'when an invalid path is provided' do
      it 'outputs an error' do

      end
    end
  end
end