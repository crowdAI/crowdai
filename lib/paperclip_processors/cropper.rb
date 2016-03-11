module Paperclip
  class Cropper < Thumbnail

    def transformation_command
      if crop_command
        crop_command + " -resize #{super[2]}"
      elsif avatar_command
         avatar_command + " -resize #{super[2]}"
      else
         super
      end
    end

    def avatar_command
      target = @attachment.instance
      if target.freshly_uploaded_avatar?
        min_dim = @current_geometry.height
        if @current_geometry.width < min_dim
          min_dim = @current_geometry.width
        end
        md = min_dim.to_i.to_s
        " -thumbnail #{md}x#{md}^ -gravity center -extent #{md}x#{md}"
      end
    end

    def crop_command
      target = @attachment.instance
      if target.cropping?
        "-auto-orient -crop #{target.crop_w}x#{target.crop_h}+#{target.crop_x}+#{target.crop_y}"
      end
    end

  end
end
