class Api::V1::SpacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @spaces = current_user.spaces.includes(:tags).order('created_at ASC')
    render json: @spaces
  end

  def show
    @space = current_user.spaces.includes(:tags).find_by(id: params[:id])
    render json: @space
  end

  def create

    if(params[:tags].nil? || params[:tags].empty?)
      render json: @space.errors, status: :unprocessable_entity
    else
      tags = retrieve_tags

      @space = current_user.spaces.build
      @space.name = params[:name]
      @space.url  = params[:url]
      @space.tags = tags

      if @space.save!
        render json: @space
      else
        render json: @space.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if(params[:tags].nil? || params[:tags].empty?)
      render json: @space.errors, status: :unprocessable_entity
    else
      tags = retrieve_tags

      @space = current_user.spaces.find_by(id: params[:id])
      @space.name = params[:name]
      @space.url  = params[:url]
      @space.tags = tags

      if @space.save!
        render json: @space
      else
        render json: @space.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def retrieve_tags()
    submited_tags = params[:tags].map{|t| t.downcase }

    tags = []

    submited_tags.each do |submited| 
      tag = Tag.find_by(name: submited.downcase)

      if tag.nil?
        tags << Tag.create(name: submited.downcase)
      else
        tags << tag
      end
    end

    tags
  end
  
end
