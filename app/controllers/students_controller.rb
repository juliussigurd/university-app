class StudentsController < ApplicationController

    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            # session[:student_id] = @student.id
            flash[:notice] = "Welcome to Tech university, you have successfully been signed up"
            redirect_to root_path
        else
            render 'new'
        end
    end

    private

    def student_params
        params.require(:student).permit(:name, :email)
    end
    
end