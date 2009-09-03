# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cart_guide_session',
  :secret      => 'aa113beda642cbd658a681cf1e9f02522e09a85ea88ad264b8c97858af0fcd385b4b800b330ec4f27164969fb5fb062b392a993f8f535ecaa9c668f0315837af'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
