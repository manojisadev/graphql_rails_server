module Mutations
  class CreateTodo < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    argument :task, String, required: true


    field :todo, Types::TodoType, null: true
    field :errors, [String], null: false


    def resolve(task:) 
      todo = Todo.new(task: task)
      if(todo.save)
      {
        todo: todo,
        errors: []
      }
      else 
      {
        todo: nil,
        errors: user.errors.full_messages
      }
      end
    end
  end
end
