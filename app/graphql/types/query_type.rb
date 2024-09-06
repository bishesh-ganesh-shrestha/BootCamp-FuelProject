# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [ Types::NodeType, null: true ], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ ID ], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user_login, resolver: Resolvers::Users::UserLogin
    field :fetch_tenant, resolver: Resolvers::Tenants::TenantResolver
    field :get_all_clients, resolver: Resolvers::Clients::GetAllClients
    field :get_client_by_id, resolver: Resolvers::Clients::GetClientById
    field :get_all_merchandise_categories, resolver: Resolvers::MerchandiseCategories::GetAllMerchandiseCategories
    field :get_merchandise_category_by_id, resolver: Resolvers::MerchandiseCategories::GetMerchandiseCategoryById
    field :get_all_merchandises, resolver: Resolvers::Merchandises::GetAllMerchandises
    field :get_merchandise_by_category, resolver: Resolvers::Merchandises::GetMerchandiseByCategory
  end
end
