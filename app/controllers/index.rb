# GET ================================================

get '/' do
  @contacts = Contact.order('last_name').limit(10)
  erb :index
end

get '/contacts' do
  @contacts = Contact.order('last_name')
  erb :index
end

get '/contacts/new' do
  erb :new, layout: !request.xhr?
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :show
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :edit
end



# POST ===============================================

post '/contacts' do
  @contact = Contact.new(params[:contact])
  if @contact.save
    if request.xhr?
      erb :_table_row, layout: false, locals: {contact: @contact}
    else
      redirect to("/contacts/#{@contact.id}")
    end
  else
    erb :new
  end
end

post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  if @contact.update_attributes(params[:contact])
    redirect to("/contacts/#{@contact.id}")
  else
    erb :edit
  end
end

post '/contacts/:id/delete' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect to("/contacts")
end

