class Event < ApplicationRecord
    
    has_many :tickets, dependent: :destroy
    belongs_to :owner, class_name: "User"

    validates :name,length:{maximum:50}, presence: true
    validates :place,length:{maximum:100}, presence: true
    validates :start_date,length:{maximum:2000}, presence: true
    validates :end_at, presence: true
    validates :content, presence: true
    validate  :time_series

    def time_series
        unless start_date && :end_at
            return
        end

        if end_at < start_date
            errors.add(:start_time, "終了時刻は開始時刻より遅い時間に設定してください")
        end
    end

    def created_by(user)
        return false unless user
        user.id == owner_id
    end
end
