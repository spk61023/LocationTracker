class UserLocation < ApplicationRecord
  before_save :convert_epoch_to_datetime

  private

  def convert_epoch_to_datetime
    self.time = Time.at(time.to_i) if time.present?
  end
end
