require 'rails_helper'

RSpec.describe Api::V1::ProjectsController, type: :controller do

  let!(:user) { User.create( email: 'rosendo@hills.biz', password: '1234567') }

  before(:each) do
      sign_in(user)
  end

  describe "GET /index" do
    let!(:projects) { create_list(:project, 2) }

    it "renders a successful response" do
      get :index

      expect(response).to be_successful
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "GET /old or newest project" do
    it 'should return project in the proper order' do
      old_project = create :project
      newer_project = create :project
      expect((Project).first['id']).to eq(old_project.id)
      expect((Project).last['id']).to eq(newer_project.id)
    end
  end

  describe "paginate" do
    let!(:project1) { create(:project, title: 'now', created_at: DateTime.now) }
    let!(:project2) { create(:project, title: 'yesterday', created_at: DateTime.yesterday) }

    it 'should paginate results' do

      get :index, params: { page: 2, per_page: 1 }

      expect(JSON.parse(response.body).length).to eq 1
      expect(JSON.parse(response.body).first['id']).to eq(project2.id)
      # expect(JSON.parse(response.body)).to contain_exactly("yesterday")
    end
  end

  describe "GET /old_tasks" do
    # let!(:project) { Project.create(attributes: { title: 'title', complexity: 3, user_id: 2} ) }
    let!(:project) { create(:project) }

    it "renders a successful response" do
      get :old_tasks, params: { id: project }

      expect(response).to be_successful
      expect(assigns(:project)).to be_persisted
      expect(assigns(:project)).to be_a(Project)
    end

    it "routes to #old_tasks" do
      should route(:get, 'api/v1/projects/1/old_tasks').to(action: :old_tasks, id: 1)
    end
  end

  describe "GET /show" do
    let!(:project) { create(:project) }

    it "renders a successful response" do
      get :show, params: { id: project }

      expect(response).to be_successful
      expect(assigns(:project)).to be_persisted
      expect(assigns(:project)).to be_a(Project)
    end

    it "routes to #show" do
      should route(:get, 'api/v1/projects/1').to(action: :show, id: 1)
    end
  end








  describe '#destroy' do
    let(:user) { create :user }
    let(:project) { create :project}

    subject { delete :destroy, params: { id: project.id } }

    it 'should have 204 status code' do
       subject
       expect(response).to have_http_status(:no_content)
     end

     it 'should have empty json body' do
        subject
        expect(response.body).to be_blank
      end

      it 'should destroy the project' do
        project
        expect { subject }.to change(Project, :count).by -1
      end
  end









  # describe "POST /create" do
  #   context "with valid parameters" do
  #
  #     it "creates a new Project" do
  #       project = Project.create(id: 1, title: 'title', complexity: 3, user: user)
  #       post :create
  #       expect { subject }.to change(Project, :count).by 1
  #     end
  #
  #     it "renders a JSON response with the new project" do
  #       project = Project.create(id: 1, title: 'title', complexity: 3, user: user)
  #
  #       post :create
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  #
    # context "with invalid parameters" do
    #   let!(:project) { Project.create(attributes: { title: '', complexity: 3, user_id: user.id} ) }
    #
    #   it "does not create a new Project without title" do
    #
    #     post :create
    #     expect { subject }.to change(Project, :count).by(0)
    #   end

      # it "renders a JSON response with errors for the new project" do
      #   post projects_url,
      #        params: { project: invalid_attributes }, headers: valid_headers, as: :json
      #   expect(response).to have_http_status(:unprocessable_entity)
      #   expect(response.content_type).to eq("application/json")
      # end
   #  end
  # end
  #
  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested project" do
  #       project = Project.create! valid_attributes
  #       patch project_url(project),
  #             params: { project: new_attributes }, headers: valid_headers, as: :json
  #       project.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "renders a JSON response with the project" do
  #       project = Project.create! valid_attributes
  #       patch project_url(project),
  #             params: { project: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "renders a JSON response with errors for the project" do
  #       project = Project.create! valid_attributes
  #       patch project_url(project),
  #             params: { project: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq("application/json")
  #     end
  #   end
  # end
  #
  # describe "DELETE /destroy" do
  #   it "destroys the requested project" do
  #     project = Project.create! valid_attributes
  #     expect {
  #       delete project_url(project), headers: valid_headers, as: :json
  #     }.to change(Project, :count).by(-1)
  #   end
  # end
end
