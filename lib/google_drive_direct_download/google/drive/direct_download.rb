# frozen_string_literal: true

module Google
  module Drive
    class DirectDownload
      attr_accessor :file_url

      BASE_URL = 'https://drive.google.com/'

      def initialize(file_url)
        @file_url = file_url
      end

      def call
        return '' if invalid_file_url?

        "#{BASE_URL}uc?export=download&id=#{file_id}"
      end

      private

      def file_id
        @file_id ||= file_url.match(/\d[a-zA-Z0-9_-]+/).to_s
      end

      def invalid_file_url?
        file_id.empty? || invalid_file_url_syntax? || invalid_file_url_domain?
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
