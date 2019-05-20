class Patient
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end
  
  def appointments
    Appointment.all.select do |appointment|
      appointment.patient == self
    end
  end
  
  def doctors
    doctors_array = []
    Appointment.all.select do |appointment|
      if appointment.patient == self
        doctors_array << appointment.doctor
      end
    end
    return doctors_array
  end
  
end