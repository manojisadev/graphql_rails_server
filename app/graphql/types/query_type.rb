module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.


    field :todos, [Types::TodoType], null: false

    def todos
      Todo.all
    end

    field :todo, Types::TodoType, null: false do 
      argument :id, ID, required: true
    end

    def todo(id:)
      Todo.find_by(id: id)
    end

    field :todo_by_task, Types::TodoType, null: false do 
      argument :task, String, required: true
    end

    def todo_by_task(task:)
      Todo.find_by(task: task)
    end

  end
end
