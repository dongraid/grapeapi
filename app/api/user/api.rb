module User
  class API < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json
    default_format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    resource :users do
      desc 'List of users'
      get '', root: :users do
        Employee.all
      end

      desc 'Get a user by email'
      params do
        requires :email, type: String
      end
      route_param :email do
        get do
          Employee.find_by(email: params[:email])
        end
      end

      desc 'Create user'
      params do
        requires :first_name, type: String
        requires :last_name, type: String
        requires :email, type: String
      end
      post do
        Employee.create!(params)
      end
    end
  end
end
