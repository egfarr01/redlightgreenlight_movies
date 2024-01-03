// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import Rails from "@rails/ujs";
import "jquery";
import "bootstrap";
import "controllers";
import "./movies.js";


Rails.start();
