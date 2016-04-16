class Subject < ActiveRecord::Base
  # Validaciones para que un 'Subject'
  validates :subject_name, presence: true

  # Metodo para realizar el calculo del promedio de las asignaturas
  def calculate_average
    self.exam_average = self.exam_1 + self.exam_2 + self.exam_3
  end
end
