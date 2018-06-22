## Image Uploads

TODO to be replaced with ActiveStorage

Static image uploads and managed using Carrierwave, and there is an uploader to control this ```ImageUploader```

#### Model Layer

The uploader field is called by convention ```image_file```.

In the model class

```ruby
mount_uploader :image_file, ImageUploader
```

#### Controller

The ```:image_file``` field needs to added to permitted attributes.

### View

#### Edit

```erb
<label>Image</label>
<div class="upload">
  <%= f.file_field :image_file, class: 'file-upload' %>
  <span>Your image will be cropped if necessary. 5MB limit</span>
</div>
```

#### Show

A cell exists for presentation of the images. There are two sizes available for images: ```:thumbnail``` and ```:medium```. The default is ```:medium```

If an image cannot be found, a placeholder image is used instead.

Example:

```erb
<%= concept(Image::Cell,@challenge,size: :thumbnail) %>
```
