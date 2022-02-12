# frozen_string_literal: true

module Google
  module Docs
    class DirectDownload
      VALID_EXPORT_FORMATS = %w[html pdf docx txt odt epub].freeze
      BASE_URL = 'https://docs.google.com/'

      attr_accessor :file_url, :export_format
      def initialize(file_url, export_format = :pdf)
        @file_url = file_url
        @export_format = export_format
      end

      def call
        return '' if invalid_file_url?

        "#{BASE_URL}document/d/#{file_id}/export?format=#{export_format}"
      end

      private

      def invalid_file_url?
        file_id.empty? ||
          invalid_file_url_syntax? ||
          invalid_file_url_domain? ||
          invalid_export_format?
      end

      def file_id
        @file_id ||= file_url.match(/\d[a-zA-Z0-9_-]+/).to_s
      end

      def invalid_export_format?
        !VALID_EXPORT_FORMATS.include?(export_format.to_s)
      end

      def invalid_file_url_syntax?
        (file_url =~ URI::DEFAULT_PARSER.make_regexp).nil?
      end

      def invalid_file_url_domain?
        !file_url.start_with?(BASE_URL)
      end
    end
  end
end
