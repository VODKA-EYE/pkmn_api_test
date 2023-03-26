# frozen_string_literal: true

module RatingsHelper
  def date_range
    "1.#{params[:date_range]}.ago" if valid_date_range
  end

  # checking date_range, if its date, then continue
  def valid_date_range
    return false unless params.key? :date_range

    # %w - array of text, separated by spaces, checking has day/week/month
    %w[day week month].include?(params[:date_range])
  end

  # taking hash, if text or -0 then 1, else number, and cuts number down
  def amount
    a = params[:amount][0, 10].to_i
    a <= 0 ? 1 : a
  end
end
