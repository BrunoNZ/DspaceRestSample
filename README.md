# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
* 

# Disable/Enable ActiveRecord

The modifications made to disable ActiveRecord were the following. (Commit: https://gitlab.c3sl.ufpr.br/bnzanette/DspaceRestSample/commit/67d4dda00074d655329da67612a461aaa91ab2f9)
To re-enable it, just rollback them.


``` diff
diff --git a/Gemfile b/Gemfile
index a3d5063..b6ced7e 100644
--- a/Gemfile
+++ b/Gemfile
@@ -3,7 +3,7 @@ source 'https://rubygems.org'
 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
 gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
 # Use sqlite3 as the database for Active Record
-gem 'sqlite3'
+# gem 'sqlite3'
 # Use Puma as the app server
 gem 'puma', '~> 3.0'
 # Use SCSS for stylesheets
diff --git a/config/application.rb b/config/application.rb
index cf60d97..4bb508b 100644
--- a/config/application.rb
+++ b/config/application.rb
@@ -1,6 +1,16 @@
 require_relative 'boot'
 
-require 'rails/all'
+require "rails"
+# Pick the frameworks you want:
+require "active_model/railtie"
+require "active_job/railtie"
+# require "active_record/railtie"
+require "action_controller/railtie"
+require "action_mailer/railtie"
+require "action_view/railtie"
+require "action_cable/engine"
+require "sprockets/railtie"
+require "rails/test_unit/railtie"
 
 # Require the gems listed in Gemfile, including any gems
 # you've limited to :test, :development, or :production.
@@ -21,6 +31,6 @@ module DspaceRestSample
     # config.i18n.default_locale = :de
 
     # Do not swallow errors in after_commit/after_rollback callbacks.
-    config.active_record.raise_in_transactional_callbacks = true
+    # config.active_record.raise_in_transactional_callbacks = true
   end
 end
diff --git a/config/environments/development.rb b/config/environments/development.rb
index e64889c..5dafa1d 100644
--- a/config/environments/development.rb
+++ b/config/environments/development.rb
@@ -35,7 +35,7 @@ Rails.application.configure do
   config.active_support.deprecation = :log
 
   # Raise an error on page load if there are pending migrations.
-  config.active_record.migration_error = :page_load
+  # config.active_record.migration_error = :page_load
 
   # Debug mode disables concatenation and preprocessing of assets.
   # This option may cause significant delays in view rendering with a large
@@ -50,5 +50,5 @@ Rails.application.configure do
 
   # Use an evented file watcher to asynchronously detect changes in source code,
   # routes, locales, etc. This feature depends on the listen gem.
-  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker
+  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
 end
diff --git a/config/environments/production.rb b/config/environments/production.rb
index f7ad920..6dc4019 100644
--- a/config/environments/production.rb
+++ b/config/environments/production.rb
@@ -82,5 +82,5 @@ Rails.application.configure do
   end
 
   # Do not dump schema after migrations.
-  config.active_record.dump_schema_after_migration = false
+  # config.active_record.dump_schema_after_migration = false
 end
diff --git a/config/initializers/new_framework_defaults.rb b/config/initializers/new_framework_defaults.rb
index 0706caf..22a2d61 100644
--- a/config/initializers/new_framework_defaults.rb
+++ b/config/initializers/new_framework_defaults.rb
@@ -15,7 +15,7 @@ Rails.application.config.action_controller.forgery_protection_origin_check = tru
 ActiveSupport.to_time_preserves_timezone = true
 
 # Require `belongs_to` associations by default. Previous versions had false.
-Rails.application.config.active_record.belongs_to_required_by_default = true
+# Rails.application.config.active_record.belongs_to_required_by_default = true
 
 # Do not halt callback chains when a callback returns false. Previous versions had true.
 ActiveSupport.halt_callback_chains_on_return_false = false
diff --git a/test/test_helper.rb b/test/test_helper.rb
index 92e39b2..4f78bf9 100644
--- a/test/test_helper.rb
+++ b/test/test_helper.rb
@@ -4,7 +4,7 @@ require 'rails/test_help'
 
 class ActiveSupport::TestCase
   # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
-  fixtures :all
+  # fixtures :all
 
   # Add more helper methods to be used by all tests here...
 end
```
