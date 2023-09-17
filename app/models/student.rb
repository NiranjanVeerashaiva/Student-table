class Student < ApplicationRecord
    validates :name, presence: true
    validates :place, presence: true
end
