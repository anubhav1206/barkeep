# == Schema Information
#
# Table name: recipes
#
#  id               :bigint           not null, primary key
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category         :string           not null
#  description      :text
#  extras           :jsonb
#  user_id          :bigint
#  parent_id        :bigint
#  source           :string           default("")
#  ingredients_blob :jsonb
#  searchable       :tsvector
#
# Indexes
#
#  index_recipes_on_parent_id   (parent_id)
#  index_recipes_on_searchable  (searchable) USING gin
#  index_recipes_on_user_id     (user_id)
#
require "rails_helper"

RSpec.describe RecipesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/recipes").to route_to("recipes#index")
    end

    it "routes to #new" do
      expect(get: "/recipes/new").to route_to("recipes#new")
    end

    it "routes to #show" do
      expect(get: "/recipes/1").to route_to("recipes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/recipes/1/edit").to route_to("recipes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/recipes").to route_to("recipes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/recipes/1").to route_to("recipes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/recipes/1").to route_to("recipes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/recipes/1").to route_to("recipes#destroy", id: "1")
    end
  end
end
