class Api::V1::AffirmationsController < Api::V1::AuthenticatedController
  def create
    affirmation = current_user.affirmations.create!(affirmation_params)
    response = { message: Message.affirmation_created, affirmation_id: affirmation.id}
    json_response(response, :created)
  end

  def show
    affirmation= Affirmation.find(params[:id])
    response = { affirmation: affirmation }
    json_response(response)
  end

  def index
    @affirmations = current_user.affirmations.all
    json_response(@affirmations)
  end

  def update
    @user=User.find(current_user.id)
    @affirmation=@user.affirmations.find(params[:id])
    @affirmation.update(affirmation_params)
    json_response(@affirmation)
  end

  def destroy
    @user=User.find(current_user.id)
    @affirmation=@user.affirmations.find(params[:id])
    @affirmation.destroy
    response = { message: Message.affirmation_deleted}
    json_response(response)
  end

  private
  def affirmation_params
    params.permit(:note)
  end
end
