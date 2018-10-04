ActiveAdmin.register User do
  permit_params %i[first_name last_name email password password_confirmation]

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    inputs 'Details' do
      input :first_name
      input :last_name
      input :email
      input :password
      input :password_confirmation

      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end

    actions
  end
end
