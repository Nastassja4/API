class Api::V1::DiariesController < Api::V1::AuthenticatedController
  def create
    diary = current_user.diaries.create!(diary_params)
    response = { message: Message.diary_created, diary_id: diary.id}
    json_response(response, :created)
  end

  def show
    @diary= Diary.find(params[:id])
    response = { title: @diary.title, entry: @diary.entry, date: @diary.created_at }
    json_response(response)
  end

  def index
    @diaries = current_user.diaries.all.order(id: :desc).paginate(page: params[:page], per_page: 5)
    json_response(@diaries)
  end

  private
    def diary_params
      params.permit(:title, :entry)
    end
end
