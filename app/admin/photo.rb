ActiveAdmin.register Photo do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  permit_params do
    permitted = [:image]
    permitted
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
     f.file_field :image
    end
    f.actions
  end

  index do
    selectable_column
    id_column

    column :thumbnail do |photo|
      photo.image_display ? image_tag(photo.image_display.remote_url) : "no image yet"
    end
  end

end
