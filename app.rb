require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('sinatra/activerecord')
require('./lib/product')
require('pg')

get('/') do
  @products = Product.all()
  erb(:index)
end

post('/products') do
  product_name = params.fetch("product_name")
  price = params.fetch("price")
  @product = Product.create({:product_name => product_name, :price => price})
  redirect "/"
end

get('/products/:id/update') do
  @product = Product.find(params.fetch("id").to_i())
  erb(:update_product)
end

patch('/products/:id') do
  product_name = params.fetch("product_name")
  price = params.fetch("price")
  @product = Product.find(params.fetch("id").to_i)
  @product.update({:product_name => product_name, :price => price})
  @products = Product.all
  erb(:index)
end

delete('/products/:id') do
  @product = Product.find(params.fetch("id").to_i)
  @product.delete()
  @products = Product.all
  erb(:index)
end
