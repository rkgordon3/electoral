# == Schema Information
#
# Table name: elections
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  game_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  date       :date
#

# == Schema Information
#
# Table name: elections
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  game_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Election < ActiveRecord::Base
  validates  :name, presence: true
  #, uniqueness: { case_sensitive: false }
  attr_accessible :game_id, :name, :date
  has_many :events
  has_many :candidates
  belongs_to :game

  attr_reader :start_date

  def start_date
  	@state_date ||= Date.new(date.year, date.month-2, 1)
  end
end
