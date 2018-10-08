class Special < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :comedian

  def self.avg_run_length
    if self.all.empty?
    else
      average(:run_length).round
    end
  end
end
