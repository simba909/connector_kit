require 'connector_kit/models/build'

module ConnectorKit
  # Mapper between a HTTParty response and a list of Builds
  class BuildListResponseMapper
    def map(data)
      data.map { |build| Build.new(build) }
    end
  end
end
