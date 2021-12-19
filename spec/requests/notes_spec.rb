require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  describe "GET /index" do
    it "GET" do
      d = create(:diary)
      create(:note, diary: d)
      get :index
      expect(assigns(:notes)).to eq(Note.all)
    end
  end

  describe "GET /show" do
    it "GET" do
      a = create(:diary)
      d = create(:note, diary: a)
      get :show, params: { id: d.id }
      expect(assigns(:note)).to eq(Note.find(d.id))
    end
  end

  describe "POST /create" do
    it "POST" do
      a = create(:diary)
      d = build(:note, diary: a)
      post :create, params: { note: { text: d.text, diary_id: d.diary.id } }
      expect(assigns(:note).text).to eq(d.text)
    end
  end

  describe "PUT /update" do
    it "PUT" do
      a = create(:diary)
      d = create(:note, diary: a)
      put :update, params: { id: d.id, note: { text: 'test', diary_id: d.diary.id } }
      expect(assigns(:note).text).to eq('test')
    end
  end

  describe "DELETE /destroy" do
    it "DELETE" do
      a = create(:diary)
      d = create(:note, diary: a)
      expect(Note.find(d.id)).to eq(d)
      delete :destroy, params: { id: d.id }
      expect(Note.first(d.id)).to eq([])
    end
  end
end
