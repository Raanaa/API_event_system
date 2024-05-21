class Api::V1::AuthenticationController < ApplicationController
  def login
      # Find the user by email
      user = User.find_by(email: params[:email])
      # Check if user exists and password is correct
      if user && user.authenticate(params[:password])
        # Generate a JWT token
        token = user.generate_token
        # Return the token in the JSON response
        render json: { token: token }, status: :ok
      else
        # Return an error response if authentication fails
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
end
