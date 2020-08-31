class PostsController < ApplicationController


    def index
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.create(post_params(:title, :content, :blogger_id, :destination_id))
        if @post.valid?
            @post.update(likes:0)
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def new
        @post = Post.new
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params(:title, :content, :blogger_id, :destination_id))
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end
    end

    def likes
        @post = Post.find(params[:id])
        @post.likes +=1
        @post.save
        redirect_to post_path(@post)
    end

    private


    def post_params(*args)
        params.require(:post).permit(*args, :likes)
    end        
end