class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  has_attached_file :image,
  :styles => {
    :thumb => {:geometry => "100x100>"},
    :medium => {:geometry => '220>'},
    :large => {:geometry => "800x800>"}
  },
  :processors => [:cropper],
  :convert_options => {
    :thumb => "-quality 90 -strip",
    :medium => "-quality 90 -strip",
  }

  validates_attachment :image, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  #validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }



  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def freshly_uploaded_avatar?
    self.imageable_type == "Participant" && crop_x.blank? && crop_y.blank? && crop_w.blank? && crop_h.blank?
  end

  def get_true_size
    [Paperclip::Geometry.from_file(pic.url(:original)).width,
     Paperclip::Geometry.from_file(pic.url(:original)).height ].join(",")
  end

  def do_crop_reprocess
    if self.cropping?
      image.reprocess!
    end
  end

  def do_avatar_reprocess
    if self.freshly_uploaded_avatar?
      image.reprocess!
    end
  end
end
