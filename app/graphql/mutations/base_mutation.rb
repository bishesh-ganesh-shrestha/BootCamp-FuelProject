# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    # def current_user
    #   context[:current_user]
    # end

    # def current_courier
    #   context[:current_courier]
    # end
  end
end
