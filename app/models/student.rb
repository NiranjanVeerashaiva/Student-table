class Student < ApplicationRecord
    validates :name, presence: true
    validates :place, presence: true

    scope :sorted, ->{ order(arel_table[:publieshed_at].desc.nulls_last).order(updated_at: :desc) } 
    scope :draft, -> { where(publieshed_at:nil) }
    scope :publieshed, -> { where("publieshed_at <= ?", Time.current) }
    scope :scheduled, -> { where("publieshed_at > ?", Time.current) }

    def draft?
        publieshed_at.nil?
    end
    def publieshed?
        publieshed_at? && publieshed_at <= Time.current
    end
    def scheduled?
        publieshed_at? && publieshed_at > Time.current
    end
end

