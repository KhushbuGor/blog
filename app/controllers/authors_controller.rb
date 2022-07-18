class AuthorsController < ApplicationController
    def index
        @authors = Author.all
    end

    def show
        @author = Author.find(params[:id])
    end

    def new 
        @author = Author.new
    end 

    def create 
        @author = Author.new(author_params)

        respond_to do |format|
        if @author.save
            format.html {redirect_to @author,notice: "Author Created successfully"}
            format.json {render :show,status: :created, location: @author}
            
        else
            format.html{ render :new, status: :unprocessable_entity }
            format.json {render json: @author.errors, status: :unprocessable_entity}
        end
        end
    end

    def edit
        @author = Author.find(params[:id])
    end
    def update
        respond_to do |format|
        @author = Author.find(params[:id])

        
        if @author.update(author_params)
            format.html { redirect_to @author, notice: "Author was successfully updated." }
            format.json { render :show, status: :ok, location: @author }
            
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @author.errors, status: :unprocessable_entity }
            
        end
        end
    end
    def destroy
        @author = Author.find(params[:id])
        @author.destroy 
        respond_to do |format|
            format.html { redirect_to authors_path ,status: :see_othe}
            format.json { head :no_content }
          end
        end

    private
    def author_params
      params.require(:author).permit(:name, :description)
    end
end
