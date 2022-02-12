# frozen_string_literal: true

RSpec.describe Google::DirectDownload do
  describe '#call' do
    let(:subject) { described_class.new(link_url).call }

    context 'Google Drive link' do
      let(:link_url) { 'https://drive.google.com/file/d/1rPaKSOqnOyrnwhYctJH1oEZJXRf45Izm/view?usp=sharing' }
      let(:google_drive_direct_download) { instance_spy(Google::Drive::DirectDownload) }

      before do
        allow(Google::Drive::DirectDownload).to receive(:new).and_return(google_drive_direct_download)
      end

      it 'calls google_drive_direct_download' do
        subject
        expect(google_drive_direct_download).to have_received(:call).once
      end
    end

    context 'Google Docs link' do
      let(:link_url) { 'https://docs.google.com/document/d/1y0PEBZv47rfYkvLQugUv_RmInahlcMyo898fLabTxQ0/edit?usp=sharing' }
      let(:google_docs_direct_download) { instance_spy(Google::Docs::DirectDownload) }

      before do
        allow(Google::Docs::DirectDownload).to receive(:new).and_return(google_docs_direct_download)
      end

      it 'calls google_docs_direct_download' do
        subject
        expect(google_docs_direct_download).to have_received(:call).once
      end
    end

    context 'Invalid link service' do
      let(:link_url) { 'https://italomatos.com/teste' }

      it { is_expected.to be_empty }
    end
  end
end
