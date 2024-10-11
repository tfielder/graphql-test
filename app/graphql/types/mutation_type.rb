# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # field :create_author, Types::AuthorType, null: true, description: "Create an author" do
    #   argument :first_name, String, required: false
    #   argument :last_name, String, required: false
    #   argument :yob, Int, required: false
    #   argument :is_alive, Boolean, required: false
    # end

    # def create_author(first_name:, last_name:, yob:, is_alive:)
    #   Author.create first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive
    # end
  
    #alternative way to create a mutation
    field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor #indicates external file defining
    field :update_author, Boolean, null: false, description: "Update an author" do
      argument :author, Types::AuthorInputType, required: true
    end

    def update_author(author:)
      existing = Author.where(id: author[:id]).first
      existing&.update author.to_h
    end

    field :delete_author, Boolean, null: false, description: "Delete an author" do
      argument :id, ID, required: true
    end

    def delete_author(id:)
      Author.find(id).delete #or destroy_all if we remove the other association-based items
      true
    end
  end
end
