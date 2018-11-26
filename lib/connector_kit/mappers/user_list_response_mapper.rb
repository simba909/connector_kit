require 'connector_kit/models/user'

module ConnectorKit
  # Mapper between a HTTParty response and a list of Users
  class UserListResponseMapper
    def map(data)
      data.map { |user| User.new(user) }
    end
  end
end
