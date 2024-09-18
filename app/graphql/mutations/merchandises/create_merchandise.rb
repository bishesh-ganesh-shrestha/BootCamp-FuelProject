module Mutations
  module Merchandises
    class CreateMerchandise < BaseMutation
      argument :merchandise_category_id, ID, required: true
      argument :merchandise_info, Types::InputObjects::MakeMerchandiseInputType, required: true

      field :merchandise, Types::Merchandises::MerchandiseType, null: false
      field :errors, [ String ], null: false
      field :message, String, null: true

      def resolve(merchandise_category_id:, merchandise_info:)
        merchandise_service = ::Merchandises::MerchandiseService.new({ merchandise_category_id: merchandise_category_id, merchandise_info: merchandise_info.to_h }.merge(current_user: current_user)).execute_create_merchandise

        if merchandise_service.success?
          {
            merchandise: merchandise_service.merchandise,

            errors: [],
            message: "Merchandise created successfully"
          }

        else
          {
            merchandise: nil,
            errors: merchandise_service.errors,
            message: "Merchandise creation failed"
          }
        end
      end
    end
  end
end
