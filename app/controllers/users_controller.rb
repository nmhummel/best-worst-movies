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
            @user.avatar.purge
            @user.avatar.attach(params[:user][:avatar])
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

    def edit
      @user = Movie.find_by_id(current_user)

      #@ranking = @movie.rankings.build(user_id: current_user.id) #????
      redirect_to user_path
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to @user
  end

     


    # def upload
    #     uploaded_file = params[:avatar]
    #     File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
    #       file.write(uploaded_file.read)
    #     end
    # end

end
