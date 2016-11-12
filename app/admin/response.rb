ActiveAdmin.register Response do

  permit_params :intent, :response_text, :intent, :user_id

  index do
    id_column
    column :intent
    column :response_text
    t.string :intent
    column do |resource|
      resource.user.full_name
    end


  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :intent
      f.input :user_id, as: :select, collection: user_collection, required: true
      f.input :response_text
    end
    actions
  end

end