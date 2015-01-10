class Admin::UsersController < Admin::BaseController

  helper_method :sort_column, :sort_direction

  before_filter :find_user, :only => [:edit, :update, :show, :destroy]

  def index
    @q = User.search(params[:q])
    @users = find_users
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, :notice => "Successfully created user."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, :notice => "Successfully updated user."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, :notice => "User deleted."
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

  def find_users
    search_relation = @q.result
    @users = search_relation.order(sort_column + " " + sort_direction).references(:user).page params[:page]
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit()
  end

end
