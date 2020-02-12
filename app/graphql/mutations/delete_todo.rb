module Mutations
  class DeleteTodo < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    argument :task_id, ID, required: true


    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(task_id:)
      todo = Todo.destroy(task_id)
      if(todo.destroyed?)
      {
        success: true,
        errors: []
      } else 
      {
        success: false,
        errors: todo.errors.full_messages
      }
    end
    end
  end
end
