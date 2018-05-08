ActiveAdmin.register Lecture do
  permit_params(:content, :attachment, :course_id)
  index do
    selectable_column
    id_column
    column :content
    column :attachment 
    column :course
    column :created_at
    column :updated_at
    column :cached_votes_total
    actions
  end

  show do |user|
    attributes_table do
      row :content 
      row :attachment
      row :course
      row :created_at
      row :updated_at  
      row :cached_votes_total
    end   
  end 

  form do |form|
    form.inputs "Lecture Details" do
      form.input :course
      form.input :content
      form.input :attachment
    end
    form.actions
  end
  scope :all,default: true

  filter :content
  filter :course
  filter :created_at

end  