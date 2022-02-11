RSpec.describe GoogleDrive::DirectDownload do
  
  
  describe '#call' do 

    context 'valid file url syntax' do
      let(:file_url) { 'https://docs.google.com/document/d/1y0PEBZv47rfYkvLQugUv_RmInahlcMyo898fLabTxQ0/edit?usp=sharing'} 
      subject { described_class.new(file_url).call }
      
      it 'returns correct direct download url' do 
        is_expected.to eq('https://docs.google.com/document/d/1y0PEBZv47rfYkvLQugUv_RmInahlcMyo898fLabTxQ0/export?format=pdf')
      end

      context 'when export format is not default' do
        describe 'with valid export format' do
          subject { described_class.new(file_url, :html).call }

          it { is_expected.to eq('https://docs.google.com/document/d/1y0PEBZv47rfYkvLQugUv_RmInahlcMyo898fLabTxQ0/export?format=html') }
        end

        describe 'with invalid export format' do
          subject { described_class.new(file_url, :xpto).call }
          
          it { is_expected.to be_empty }
        end
      end
    end

    context 'invalid file url syntax' do
      describe 'file url without file_id' do 
        let(:file_url) { 'https://docs.google.com/teste/invalid_file'}
        subject { described_class.new(file_url).call }

        it { is_expected.to be_empty }
      end

      describe 'invalid url' do
        let(:file_url) { 'abcd/d/1y0PEBZv47rfYkvLQugUv_RmInahlcMyo898fLabTxQ0/edit?usp=sharing'}
        subject { described_class.new(file_url).call }

        it { is_expected.to be_empty }
      end
    end
  end
end