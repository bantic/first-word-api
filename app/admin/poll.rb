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
          content_tag :li do
            html = ''
            poll.poll_items.each do |item|
              photo = item.photo
              html += content_tag :p, item.title
              if photo
                html += image_tag photo.image_display.remote_url
              else
                html += "(No picture)"
              end
            end
            html.html_safe
          end
        end
      end
    end

    actions
  end
end
