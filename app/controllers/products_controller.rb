class ProductsController < ApplicationController
    def index
        @all_products = Product.all
    end

    def show
        @prod = Product.find params[:id]
        @categories = Category.where.not(id: @prod.category.id)
        @comments = CommentsController.get_comments params[:id]
    end

    def edit
        @prod = Product.find params[:id]
        @categories = Category.where.not(id: @prod.category.id)
    end

    def new
        @categories = Category.all
    end

    def create
        prod = Product.new(
            name:params[:name],
            description:params[:description],
            price:params[:price].tr('$', ''),
            category_id:params[:category])
        if !prod.valid?
            redirect_to '/products/new'
        else
            prod.save
            redirect_to '/'
        end
    end

    def update
        prod = Product.find(params[:id]).update(
            name:params[:name],
            description:params[:description],
            price:params[:price].tr('$', ''),
            category_id:params[:category])
        redirect_to '/'
    end

    def destroy
        Product.find(params[:id]).destroy
        redirect_to '/'
    end
end
