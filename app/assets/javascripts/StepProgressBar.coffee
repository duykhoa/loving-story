class StepProgressBar
  state: '#percentage'

  constructor: (@progressBarElement, @totalStep = 3, @initValue = 0) ->
    @__setState(@initValue)

  setCurrentStep: (step = 1) ->
    value = if (step > 0 and step <= @totalStep) then (step - 1) / (@totalStep - 1) * 100 else 0
    @__setState(value + "%")

  __setState: (value = @initValue) ->
    $(@progressBarElement).find(@state).css('width', value)

window.StepProgressBar = StepProgressBar
