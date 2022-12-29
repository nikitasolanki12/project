# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @post = Post.all.find(params[:post_id])
    Like.create(user_id: current_user.id, post_id: @post.id)
    redirect_to posts_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end

  private

  def like_params
    params.require(:like).permit(:value, :user_id, :post_id)
  end
end
