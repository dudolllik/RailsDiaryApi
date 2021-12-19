require 'rails_helper'

RSpec.describe DiariesController, type: :controller do
  describe "GET /index" do
    it "GET" do
      create(:diary)
      get :index
      expect(assigns(:diaries)).to eq(Diary.all)
    end
  end

  describe "GET /show" do
    it "GET" do
      d = create(:diary)
      get :show, params: { id: d.id }
      expect(assigns(:diary)).to eq(Diary.find(d.id))
    end
  end

  describe "POST /create" do
    it "POST" do
      d = build(:diary)
      post :create, params: { diary: { title: d.title, expiration: d.expiration, kind: d.kind } }
      expect(assigns(:diary).title).to eq(d.title)
    end
  end

  describe "PUT /update" do
    it "PUT" do
      d = create(:diary)
      put :update, params: { id: d.id, diary: { title: 'test', expiration: d.expiration, kind: d.kind } }
      expect(assigns(:diary).title).to eq('test')
    end
  end

  describe "DELETE /destroy" do
    it "DELETE" do
      d = create(:diary)
      expect(Diary.find(d.id)).to eq(d)
      delete :destroy, params: { id: d.id }
      expect(Diary.first(d.id)).to eq([])
    end
  end
end
