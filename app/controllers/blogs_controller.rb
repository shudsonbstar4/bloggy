class BlogsController < ApplicationController
  # GET /blogs
  # GET /blogs.json
  def index
    # was Blog.all; Blog.order('id desc')
		#@tags = Tag.all #Needed to define @tags in controller to make it work
		@tags = Tag.select(:name).uniq
		if params[:name].blank?
			@blogs = Blog.order('id desc')
		else
			tags = Tag.where(:name => params[:name])
			@blogs = []
			tags.each do |tag|
				parent_blog = tag.blog
				@blogs.push(parent_blog)
			end
		end
		
		#if !params[:tag_id].blank?
			#t = Tag.find(params[:tag_id])
			#@tags = Tag.where(:name => :t.name) #needed to use :name instead of :title because the column is called name
			#@blogs = []
			#@tags.each do |tag|
				#@parent_blog = tag.blog
				#@blogs.push(parent_blog)
			#end
		#end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
		@comments = @blog.comments
		@tags = @blog.tags

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.json
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
		@tag = Tag.new #class name always singular
		@tag.blog_id = @blog.id
		#@tags.save
		#redirect_to @blog
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(params[:blog])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end
end
