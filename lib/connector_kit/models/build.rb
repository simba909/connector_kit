module ConnectorKit
  # Simple model class for representing Builds in the App Store Connect API
  class Build
    attr_reader :id,
                :expired,
                :processing_state,
                :version,
                :uploaded_date,
                :expiration_date

    def initialize(options)
      @id = options['id']

      attrs = options['attributes']
      @expired = attrs['expired']
      @processing_state = attrs['processingState']
      @version = attrs['version']
      @uploaded_date = Time.parse(attrs['uploadedDate']).getlocal
      @expiration_date = Time.parse(attrs['expirationDate']).getlocal
    end
  end
end
