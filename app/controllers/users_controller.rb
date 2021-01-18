class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
         # if (user = User.create(user_params))
            session[:user_id] = @user.id
            # @user.image.purge
            # @user.image.attach(params[:user][:image])
            redirect_to user_path(@user)
          else
            render :new
          end
      end

    def show
        if user_is_authenticated
          @user = User.find_by_id(params[:id])
        else
          redirect_to '/'
        end
    end

    private 

    # def upload
    #     uploaded_file = params[:avatar]
    #     File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
    #       file.write(uploaded_file.read)
    #     end
    # end

end
