class User < ApplicationRecord
  has_many :locations

  validates :android_device_uuid, uniqueness: true

  def self.find_or_create_by_android_device_uuid(uuid)
    # HUGE TODO: Do something way better with logging utils
    width = `tput cols`.to_i

    user = find_by(android_device_uuid: uuid)
    if user
      logger.info "=" * width
      logger.info "User with id: #{uuid} FOUND!"
      user
    else
      logger.info "=" * width
      logger.info "User with id: #{uuid} CREATED!"
      create(android_device_uuid: uuid)
    end
  end

end
