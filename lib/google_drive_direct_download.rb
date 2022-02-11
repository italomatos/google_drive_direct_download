# frozen_string_literal: true

require_relative "google_drive_direct_download/version"
require_relative "google_drive_direct_download/google/direct_download"
require_relative "google_drive_direct_download/google/docs/direct_download"
require_relative "google_drive_direct_download/google/drive/direct_download"


module GoogleDriveDirectDownload
  class Error < StandardError; end
  # Your code goes here...
end
