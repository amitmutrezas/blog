class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)
    @author.save
    redirect_to @author
  end

  def edit
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

private
  def author_params
    params.require(:author).permit(:name, :age)
  end

end
