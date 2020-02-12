module Types
  class TodoType < Types::BaseObject
    field :task, String, null: false
    field :id, ID, null: false
  end
end
