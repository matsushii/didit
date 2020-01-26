require 'rails_helper'
describe PostsController do
  describe "GET #index" do
    it "@postsにpostが降順に並べられて存在しているか" do
      posts = create_list(:post, 3)
      get :index
      expect(assigns(:posts)).to match(posts.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "indexのviewに正常に遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end
end