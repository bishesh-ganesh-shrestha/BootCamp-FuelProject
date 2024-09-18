module Resolvers
  module Users
    class UserLogin < BaseResolver
      argument :login_data, Types::InputObjects::UserLoginInputType, required: true

      type Types::Users::UserLoginResponseType, null: false
      # field :errors, [ String ], null: false

      def resolve(login_data:)
        tenant = Tenant.find_by(id: login_data.tenant_id)
        login_attr = login_data.to_h
        user = tenant.users.find_by(email: login_attr[:email])

        if user && user.valid_password?(login_data[:password])
          {
            user: user,
            errors: []
          }
        else
          {
            user: nil,
            errors: [ "Invalid email or password" ]
          }
        end
      end
    end
  end
end
