ActiveAdmin.register PollItem do
  controller do
    def find_resource
      PollItem.friendly.find(params[:id])
    end
  end

  permit_params do
    permitted = [:title, :poll_id]
    permitted
  end

  form do |f|
    f.inputs do
      f.input :poll
      f.input :title
    end
    f.actions
  end
end
