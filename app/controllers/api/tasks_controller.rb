module Api
  class TasksController < ApplicationController
    before_action :authenticate_api_user!, only: [:x_index, :x_show, :x_create, :x_update, :x_destroy]
    before_action :set_task, only: [:show, :update, :destroy]

    def index
      @tasks = Task.all
      render json: @tasks
    end

    def show
      render json: @task
    end

    def create
      @task = Task.new(task_params)
      if @task.save
        render json: @task, status: :created, location: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def update
      if @task.update(task_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @task.destroy
    end

    # このAPIを読んだ時、認証が必要です。みたいなものを表示させるようにしてみる
    def x_index
      @tasks = Task.all
      render json: @task
    end

    def x_show
      render json: @task
    end

    private
      def set_task
        @task = Task.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:title)
      end
  end
end
