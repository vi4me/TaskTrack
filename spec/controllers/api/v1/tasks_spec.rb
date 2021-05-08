require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :controller do

  let!(:user) { User.create( email: 'rosendo@hills.biz', password: '1234567') }
  let!(:project) { create(:project) }

  before(:each) do
      sign_in(user)
  end

  describe "GET /index" do
    let!(:tasks) { create_list(:task, 2) }

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

  end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     let!(:project) { create(:project) }
  #     it "creates a new Task" do
  #       subject { post :create, params: { task: { project_id: project.id, title: 'title', description: '3', deadline_date: "2020-05-05", user: user } } }
  #       expect { subject }.to change(Task, :count).by 1
  #     end
  #
  #     it "renders a JSON response with the new task" do
  #       post tasks_url,
  #            params: { task: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "does not create a new Task" do
  #       expect {
  #         post tasks_url,
  #              params: { task: invalid_attributes }, as: :json
  #       }.to change(Task, :count).by(0)
  #     end
  #
  #     it "renders a JSON response with errors for the new task" do
  #       post tasks_url,
  #            params: { task: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq("application/json")
  #     end
  #   end
  # end
  #
  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested task" do
  #       task = Task.create! valid_attributes
  #       patch task_url(task),
  #             params: { task: new_attributes }, headers: valid_headers, as: :json
  #       task.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "renders a JSON response with the task" do
  #       task = Task.create! valid_attributes
  #       patch task_url(task),
  #             params: { task: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "renders a JSON response with errors for the task" do
  #       task = Task.create! valid_attributes
  #       patch task_url(task),
  #             params: { task: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq("application/json")
  #     end
  #   end
  # end
  #
  # describe "DELETE /destroy" do
  #   it "destroys the requested task" do
  #     task = Task.create! valid_attributes
  #     expect {
  #       delete task_url(task), headers: valid_headers, as: :json
  #     }.to change(Task, :count).by(-1)
  #   end
  # end
end
