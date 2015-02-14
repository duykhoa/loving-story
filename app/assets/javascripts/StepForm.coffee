class StepForm
  constructor: (@stepFormClass, @clickButtonClass) ->
    $(@clickButtonClass).on 'click', (e) =>
      target = $(e.currentTarget)
      nextStepItem = '#step-' + target.data('step')
      @toggleStep(nextStepItem)

  toggleStep: (nextStepItem) ->
    @hideCurrentStep()
    @displayNextStep(nextStepItem)

  hideCurrentStep: ->
    $(@stepFormClass).addClass('hidden')

  displayNextStep: (nextStepItem)->
    $(nextStepItem).removeClass('hidden')
    @currentStepItem = $(nextStepItem)

window.StepForm = StepForm
