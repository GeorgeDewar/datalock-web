class TempUser < ActiveRecord::Base
  validates_length_of :pin, :is => 4, :message => "must be 4 numbers"
  validates_numericality_of :pin, :message => "must only be numbers"
  validates_presence_of :pin


end
