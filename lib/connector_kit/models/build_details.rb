module ConnectorKit
  # Simple model class for representing Build details in the App Store Connect API
  class BuildDetails
    attr_reader :id, :external_build_state, :internal_build_state

    def initialize(options)
      @id = options['id']

      attrs = options['attributes']
      @external_build_state = attrs['externalBuildState']
      @internal_build_state = attrs['internalBuildState']
    end
  end
end
