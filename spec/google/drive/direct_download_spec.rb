# frozen_string_literal: true

RSpec.describe Google::Drive::DirectDownload do
  describe '#call' do
    subject { described_class.new(file_url).call }

    context 'valid file url syntax' do
      let(:file_url) { 'https://drive.google.com/file/d/1rPaKSOqnOyrnwhYctJH1oEZJXRf45Izm/view?usp=sharing' }

      it 'returns correct direct download url' do
        is_expected.to eq('https://drive.google.com/uc?export=download&id=1rPaKSOqnOyrnwhYctJH1oEZJXRf45Izm')
      end
    end

    context 'invalid file url syntax' do
      describe 'file url without file_id' do
        let(:file_url) { 'hhttps://drive.google.com/test/invalid_file' }

        it { is_expected.to be_empty }
      end

      describe 'invalid url' do
        let(:file_url) { 'abcd/d/1y0PEBZv47rfYkvLQugUv_RmInahlcMyo898fLabTxQ0/edit?usp=sharing' }

        it { is_expected.to be_empty }
      end
    end
  end
end
