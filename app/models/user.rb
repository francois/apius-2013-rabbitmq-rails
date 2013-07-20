class User < ActiveRecord::Base
  attr_accessible :avatar, :avatar_cache, :email, :name
  mount_uploader :avatar, AvatarUploader

  ALLOWED_TYPES = %w(jpg gif png)

  def avatar_type
    type = File.extname(avatar_identifier).sub("jpeg", "jpg")[1..-1]
    raise "unknown avatar content type: #{avatar_identifier.inspect} (#{type.inspect})" unless ALLOWED_TYPES.include?(type)
  end
end
