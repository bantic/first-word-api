ActiveAdmin.register Poll do
  controller do
    def find_resource
      Poll.friendly.find(params[:id])
    end
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
   permit_params do
     permitted = [:title]
     permitted
   end

  form do |f|
    f.inputs do
      f.input :title
    end
    f.actions
  end

  index do
    selectable_column
    id_column

    column :poll_items do |poll|
      if poll.poll_items.empty?
        "None yet"
      else
        content_tag :ul do
          poll.poll_items.collect do |poll_item|
            content_tag :li do
              html = content_tag(:p, poll_item.title)
              if poll_item.photo
                html += image_tag poll_item.photo.image_display.remote_url
              end
            end
          end.join('')
        end
      end
    end
  end
end
