class Types::AuthorType < Types::BaseObject
    description "one author"

    field :id, ID, null: false
    field :first_name, String, null: true #, camelize: false #can use camelize false to ensure not camelizing on the return value
    field :last_name, String, null: true
    field :yob, Integer, null: true
    field :is_alive, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    
    field :full_name, String, null: true
    field :years_old, String, null: true

    def years_old
        "#{object.first_name} is #{Time.now.year - object.yob}"
    end

    field :coordinates, Types::CoordinatesType, null: false
    field :publication_years, [Int], null: false

    field :errors, [Types::ErrorType], null: true

    def errors
        object.errors.map { |e| { field_name: e.attribute, errors: object.errors[e.attribute] } }
    end
end

class Types::AuthorInputType < GraphQL::Schema::InputObject
    graphql_name "AuthorInputType"
    description "All the attributes needed to create/update an author"

    argument :id, ID, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :yob, Integer, required: false
    argument :is_alive, Boolean, required: false
end