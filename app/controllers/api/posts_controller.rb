module Api
  class PostsController < ApplicationController
    before_action :authenticate_api_user!, only: [:x_index, :x_show, :x_create, :x_update, :x_destroy]
    before_action :set_post, only: [:show, :update, :destroy, :x_show, :x_update, :destroy]

    def index
      @posts = Post.all
      render json: @posts
    end

    def show
      render json: @post
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        render json: @post, status: :created, location: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @post.destroy
    end

    # このAPIを読んだ時、認証が必要です。みたいなものを表示させるようにしてみる
    def x_index
      @posts = Post.all
      render json: @post
    end

    def x_show
      render json: @post
    end

    private
      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title)
      end
  end
end
