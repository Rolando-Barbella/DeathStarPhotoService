class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :description, :image, :user, :price
  validates_numericality_of :price, greater_than: 0, only_integer: true

  def self.save_and_send(upload_params)
    photo = Photo.new(upload_params)
    if photo.save
      Pusher.trigger('the_force', 'new_photo', {
        url: photo.image.url(:medium),
        description: photo.description,
        id: photo.id,
        username: photo.user.username
      })
    end
  end
end
