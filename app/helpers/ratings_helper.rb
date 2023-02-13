module RatingsHelper
  def date_range
    "1.#{params[:date_range]}.ago" if valid_date_range
  end

  def valid_date_range
    return false unless params.has_key? :date_range

    %w[day week month].include?(params[:date_range])
  end
end
