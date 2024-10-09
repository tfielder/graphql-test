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
end