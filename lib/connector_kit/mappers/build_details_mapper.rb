require 'connector_kit/models/build_details'

module ConnectorKit
  # Mapper between a HTTParty response and a BuildDetails object
  class BuildDetailsMapper
    def map(data)
      BuildDetails.new(data)
    end
  end
end
