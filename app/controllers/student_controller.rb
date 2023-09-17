class StudentController<ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @students=Student.all
    end
    def show
        @student=Student.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to "/"
    end
    def new
        @student=Student.new
    end
    def create
        @student=Student.new(student_params)
        if @student.save
            redirect_to "/"
        else
            render :new, status: :unprocessable_entity 
        end
    end
    def edit
        @student=Student.find(params[:id])
    end
    def update
        @student=Student.find(params[:id])
        if @student.update(student_params)
            redirect_to @student
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def delete
        @student=Student.find(params[:id])
        @student.destroy
        redirect_to "/"
    end
    def student_params
        params.require(:student).permit(:name, :place)
    end
end