// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "./movies.js";
import Rails from "@rails/ujs";
import "jquery";
import "bootstrap";


Rails.start();
