ActiveAdmin.register Rent do
  permit_params %i[user_id book_id from_date to_date]
end
