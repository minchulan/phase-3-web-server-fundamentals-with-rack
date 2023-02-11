#this is our server definition file.
#.ru stands for a command called rackup.
#Rack needs a web server to handle connections; WEBrick is the default Ruby library that privdes HTTP server.
#Rack runs in a loop in the background waiting for a request to come in. When it receives a request, it will call the #call method and pass in data about the request, so we can send back the appropriate response.
require 'rack'
require 'pry'

class App
  def call(env)
    path = env["PATH_INFO"]

    if path == '/'
      [200, { "Content-Type" => "text/html" }, ["<h2>Hello <em>World</em>!</h2>"]]
    elsif path == '/potato'
      [200, { "Content-Type" => "text/html" }, ["<p>Boil 'em, mash 'em, stick 'em in a stew</p>"]]
    else
      [404, { "Content-Type" => "text/html" }, ["Page not found"]]
    end
  end
end

run App.new