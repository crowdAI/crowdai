class ApplicationPresenter < SimpleDelegator
  def initialize(model, view)
    @view = view
    super(model)
  end

  def h
    @view
  end
end
