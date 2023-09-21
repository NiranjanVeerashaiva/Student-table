class StudentsController<ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_student, except: [:index, :new, :create]
    def index
        @students= user_signed_in? ? Student.sorted : Student.publieshed.sorted
    end 
    def show 
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
    end
    def update
        if @student.update(student_params)
            redirect_to @student
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def delete
        @student.destroy
        redirect_to "/"
    end
    def student_params
        params.require(:student).permit(:name, :content, :publieshed_at)
    end
    def set_student
        @student= user_signed_in? ? Student.find(params[:id]) : Student.publieshed.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to "/"
    end
end
