module ConnectorKit
  class Error < StandardError; end

  # Simple model class for representing errors in the App Store Connect API
  class APIError < Error
    attr_reader :detail, :status

    def initialize(message, detail, status)
      super(message)

      @detail = detail
      @status = status
    end
  end
end
