# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generato 456789" do
        argument :name, String, required: true
      end
    def test_field(name:)
      Rails.logger.info "Time is #{context[:time]}"
      "Hello #{name}!"
    end

    field :author, Types::AuthorType, null: true,
    description: "Returns one author instance" do
      argument :id, ID, required: true
    end

    def author(id:)
      Author.where(id: id).first
    end

    field :authors, [Types::AuthorType], null: false

    def authors
      Author.all
    end
  end
end
