class StepForm
  constructor: (@stepFormClass, @clickButtonClass, @currentStepItem)
    $(@clickButtonClass).on 'click', ->
      nextStepItem = '#step' + $(@).data('step')
      hideCurrentStep
      displayNextStep(nextStepItem)

  hideCurrentStep: ->
    $(@currentStepItem).addClass('hidden')

  displayNextStep: (nextStepItem)->
    $(nextStepItem).removeClass('hidden')
    @currentStepItem = $(nextStepItem)
