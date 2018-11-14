module ConnectorKit
  # Simple model class for representing Apps in the App Store Connect API
  class App
    attr_reader :id, :bundle_id, :name, :sku

    def initialize(options)
      @id = options['id']

      attrs = options['attributes']
      @bundle_id = attrs['bundleId']
      @name = attrs['name']
      @sku = attrs['sku']
    end
  end
end
