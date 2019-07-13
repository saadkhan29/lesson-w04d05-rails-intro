class TodosController < ApplicationController
  def index
    @todos = Todo.all.order(id: :asc)
  end
end