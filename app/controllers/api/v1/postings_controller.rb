class Api::V1::PostingsController < ActionController::API

  before_action :doorkeeper_authorize! # Requires access token for all actions

  # Run a curl command with auth, e.g.
  # curl localhost:3000/api/v1/postings/1 -H "content-type: application/json" -H "accept: application/json" \
  # -H "Authorization: Bearer vw8cslNpVpsGiAvaErFGjZKSEh-XOYmLfw9daZ5f5Lo"
  def show
    @posting = Posting.find(params[:id])
    render json: @posting
  end

  # def current_resource_owner
  #   User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  # end
end
