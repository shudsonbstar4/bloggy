class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
		
		#@name = params[:name] #make a variable visible in views, have to use instance variable
		@blog_id = params[:blog_id] #instance variable of blog_id for passing param into URL
		Rails.logger.info "BLOG_ID = #{@blog_id}" #Logging the ID to the Command Line for debugging
		
		@blog = Blog.find(@blog_id) #accessing blog id that's passed through query string variable to get the row where ID = the id passed
		#Used to add the name of the blog to the <h3> as a title to identify which blog users are writing the comment for
		
		#Could also do this to be DRY: @blog = Blog.find(params[:blog_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
		blog_id = @comment.blog_id
		@blog = Blog.find(blog_id)
		
		#Can do @blog = @comment.blog b/c DB association
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment]) #has a hash called comment, passes initial values

    respond_to do |format|
      if @comment.save # Goes in here and saves it to the DB
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
