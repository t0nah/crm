ActiveAdmin.register Customer do
  # Permit the necessary parameters for assignment
  permit_params :full_name, :phone_number, :email, :notes, :image

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  # Show the customer details, including the image
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :image do |customer|
        image_tag customer.image if customer.image.attached?
      end
    end
    active_admin_comments
  end
end
