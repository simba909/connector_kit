require 'connector_kit/models/model'

module ConnectorKit
  # Simple model class for representing Build details
  class BuildDetails < Model
    attr_reader :external_build_state, :internal_build_state

    def initialize(options)
      super(options)

      attrs = options['attributes']
      @external_build_state = attrs['externalBuildState']
      @internal_build_state = attrs['internalBuildState']
    end
  end
end
