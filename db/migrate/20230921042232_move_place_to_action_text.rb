class MovePlaceToActionText < ActiveRecord::Migration[7.0]
  def change
    Student.all.find_each do |student|
      student.update(content: student.place)
    end
    remove_column :students, :place
  end
end
