require 'connector_kit/models/model'

module ConnectorKit
  # Simple model class for representing Users in the App Store Connect API
  class User < Model
    attr_reader :first_name, :last_name, :username, :roles, :all_apps_visible

    def initialize(options)
      super(options)

      attrs = options['attributes']
      @first_name = attrs['firstName']
      @last_name = attrs['lastName']
      @username = attrs['username']
      @all_apps_visible = attrs['allAppsVisible']
      @roles = attrs['roles'].map { |role| role.downcase.to_sym }
    end

    def full_name
      "#{@first_name} #{@last_name}"
    end
  end
end
