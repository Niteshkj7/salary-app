class SalaryAllotment < ApplicationRecord
  belongs_to :employee

  validates :basic, :hra, :da, :income_tax, :state_tax, numericality: true

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |salary_allotment|
        csv << salary_allotment.attributes.values_at(*column_names)
      end
    end
  end


end
