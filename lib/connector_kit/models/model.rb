module ConnectorKit
  # Base model for representing different entities
  class Model
    attr_reader :id

    def initialize(options)
      @id = options['id']
    end
  end
end
