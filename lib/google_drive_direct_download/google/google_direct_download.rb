# frozen_string_literal: true

module Google
  class DirectDownload
    attr_accessor :link_url

    def initialize(link_url)
      @link_url = link_url
    end

    def call
      if link_url.start_with?(Google::Drive::DirectDownload::BASE_URL)
        service = Google::Drive::DirectDownload.new(link_url)
      elsif link_url.start_with?(Google::Docs::DirectDownload::BASE_URL)
        service = Google::Docs::DirectDownload.new(link_url)
      end

      return '' if service.nil?

      service.call
    end
  end
end
