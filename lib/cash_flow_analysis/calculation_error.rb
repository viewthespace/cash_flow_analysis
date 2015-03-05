module CashFlowAnalysis
  class CalculationError < StandardError
    def initializer(error)
      @cause = cause
      super "An error occurred performing the calculation. See the cause property for further information"
    end
  end
end
