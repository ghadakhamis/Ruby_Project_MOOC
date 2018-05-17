ActiveAdmin.register Lecture do
  permit_params(:content, :attachment, :course_id)
  index do 
    selectable_column
    id_column
    column :content do |lecture|
      raw lecture.content
    end  
    column :attachment do |lecture|
      link_to "Download", lecture.attachment.url
    end    
    column :course
    column :created_at
    column :updated_at
    column :cached_votes_total
    column :spams do |lecture|
      lecture.users.count()
    end  
    actions
  end

  show do |lecture|
    attributes_table do
      row :content do
        raw lecture.content
      end 
      row :attachment do 
        link_to "Download", lecture.attachment.url
      end    
      row :course
      row :created_at
      row :updated_at   
      row :cached_votes_total
      row :spams do
        lecture.users.count()
      end  
    end   
    active_admin_comments   
  end 

  form do |form|
    form.inputs "Lecture Details" do
      form.input :course
      form.cktext_area :content, class:  'ckeditor'  
      form.input :attachment
    end
    form.actions
  end
  scope :all,default: true

  filter :content
  filter :course
  filter :created_at

end  