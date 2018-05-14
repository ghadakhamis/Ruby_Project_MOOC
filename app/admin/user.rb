ActiveAdmin.register User do
  permit_params(:name, :email, :gender, :date_of_birth, :profile_picture, :password, :password_confirmation)
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :gender
    column :date_of_birth
    column :profile_picture do |user|
      image_tag user.profile_picture.url, size: "60x60" if user.profile_picture?
    end
    column :created_at
    actions
  end

  show do |user|
    attributes_table do
      row :profile_picture do
        image_tag user.profile_picture.url, size: "140x140" if user.profile_picture?
      end 
      row :name  
      row :email
      row :gender
      row :date_of_birth 
      row :created_at
      row :updated_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
    end   
  end 

  form do |form|
    form.inputs "User Details" do
      form.input :name
      form.input :email
      form.input :gender
      form.input :date_of_birth
      form.input :profile_picture
      if form.object.new_record?
        form.input :password
        form.input :password_confirmation
      end
    end
    form.actions
  end
  scope :all,default: true

  filter :email
  filter :name
  filter :date_of_birth
  filter :created_at

end    