# README

* Ruby version

  3.2.3

* Local development

  Install ruby (use rbenv) and yarn (`brew install yarn` for macbooks)

  ```sh
  git clone git@github.com:kangkyu/kyohoe_rails_pre.git
  cd kyohoe_rails_pre
  bundle install
  bin/dev
  ```

* How to use

  1️⃣ Add a doorkeeper application (`confidential` should be `false` for mobile) and get `uid`.

  ```rb
  # rails console
  a = Doorkeeper::Application.new(name: "Postman", redirect_uri: "https://oauth.pstmn.io/v1/callback")
  a.scopes = ['public']
  a.confidential = false
  a.save

  a.uid
  # "client_id_string"
  ```

  2️⃣ Have an admin user, then go to Postman and make an access token

  ```
  Admin user email is "admin@example.com" hard-coded currently
  ```
  
  3️⃣ Have a posting, and then hit the `"/api/v1/postings/1"` endpoint with the token on the header

  ```rb
  # rails console
  p = Posting.new
  p.title = "Praise"
  p.video_url = "https://www.youtube.com/watch?v=e_NFuZwBNjY"
  p.content = ""
  p.save
  ```

  Hit the endpoint by Postman or simple `curl`
  ```sh
  curl 'https://kyohoe-authorization-server-1a58960ea78f.herokuapp.com/api/v1/postings/1' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer sATeKs9y0IfTMMHSUw4nT6_zOcnskytvbc2wBz7ttWQ' -i
  # "The access token expired" in response header
  ```
