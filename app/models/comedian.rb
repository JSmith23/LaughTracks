class Comedian < ActiveRecord::Base
  validates_presence_of :name, :age
  has_many :specials

  def self.avg_age
    if self.all.empty?
    else
      average(:age).round
    end
  end

  def self.cities
    select(:city).distinct
  end


end
