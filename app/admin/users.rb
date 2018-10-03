ActiveAdmin.register User do
  permit_params %i[first_name last_name email provider uid locale tokens
                   remember_created_at encrypted_password]
end
