require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('sinatra/activerecord')
require('./lib/product')
require('./lib/purchase')
require('pg')

get('/') do
  @products = Product.all()
  @purchases = Purchase.all
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

get('/shopping_list') do
  @products = Product.all
  @purchase = Purchase.create({:total => 0})
  erb(:shopping_list)
end

patch('/purchase/:id') do
  purchase_id = params.fetch("id").to_i()
  @purchase = Purchase.find(purchase_id)
  @product_ids = params.fetch("product_ids")
  @products = Product.all()
  erb(:shopping_list)
end
