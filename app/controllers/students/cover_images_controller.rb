class Students::CoverImagesController<ApplicationController
    include ActionView::RecordIdentifier
    before_action :authenticate_user!
    before_action :set_student
    def destroy
        @student.cover_image.purge_later
       respond_to do |format|
        format.html { redirect_to edit_student_path(@student) }
        format.turbo_stream{render turbo_stream: turbo_stream.remove(dom_id(@student, :cover_image))}
       end 
    end
    def set_student
        @student=Student.find(params[:student_id])
    end
end
