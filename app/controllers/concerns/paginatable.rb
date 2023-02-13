# frozen_string_literal: true

module Paginatable
  extend ActiveSupport::Concern

  included do
    has_scope :page, default: 1
    has_scope :per_page, default: 40
  end

  protected

  def collection
    @collection ||= apply_scopes(model_klass)
  end

  def model_klass
    @model_klass ||= controller_name.classify.safe_constantize
  end

  def paginated
    {
      current_page: collection.current_page,
      total_count: collection.total_entries,
      total_pages: collection.total_pages,
      next_page: collection.next_page,
      prev_page: collection.previous_page
    }
  end

  # Pagy Methods
  def pagy_collection
    pagy collection
  end

  # rewrite pagy metadata response
  def pagy_meta(pagy)
    meta_hash = pagy_metadata pagy
    {
      current_page: meta_hash[:page],
      total_count: meta_hash[:count],
      total_pages: meta_hash[:last],
      next_page: meta_hash[:next],
      prev_page: meta_hash[:prev]
    }
  end
end
