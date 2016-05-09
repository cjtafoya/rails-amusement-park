class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    unless happiness.nil? || nausea.nil?
      nausea <= happiness ? "happy" : "sad"
    end
  end
end
