module ApplicationHelper

  def can_vote?(deal)
    !Vote.find_by_user_id_and_deal_id(current_user,deal)
  end
end
