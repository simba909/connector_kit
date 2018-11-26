require 'connector_kit/models/model'

module ConnectorKit
  # Simple model class for representing Builds
  class Build < Model
    attr_reader :expired,
                :processing_state,
                :version,
                :uploaded_date,
                :expiration_date

    def initialize(options)
      super(options)

      attrs = options['attributes']
      @expired = attrs['expired']
      @processing_state = attrs['processingState']
      @version = attrs['version']
      @uploaded_date = Time.parse(attrs['uploadedDate']).getlocal
      @expiration_date = Time.parse(attrs['expirationDate']).getlocal
    end
  end
end
