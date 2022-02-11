module GoogleDrive
  module Docs
    class DirectDownload

      VALID_EXPORT_FORMATS = %w(html pdf docx txt odt epub).freeze
      attr_accessor :file_url, :export_format
      
      def initialize(file_url, export_format=:pdf)
        @file_url = file_url
        @export_format = export_format
      end

      def call
        return "" if file_id.empty? || invalid_file_url? || invalid_export_format?

        "https://docs.google.com/document/d/#{file_id}/export?format=#{export_format.to_s}"
      end

      private

      def file_id
        file_url.match(/\d[a-zA-Z0-9_-]+/).to_s
      end

      def invalid_file_url?
        (file_url =~ URI::regexp).nil? || !file_url.start_with?("https://docs.google.com/")
      end

      def invalid_export_format?
        not VALID_EXPORT_FORMATS.include?(export_format.to_s)
      end
    end
  end
end