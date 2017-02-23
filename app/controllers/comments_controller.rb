class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def self.get_comments(prod_id)
        return Comment.where(product_id:prod_id)
    end

    def create
        Comment.create(comment:params[:comment], product:Product.find(params[:prod_id]) )
        redirect_to '/products/' + params[:prod_id]
    end
end
