#= require StepForm

describe "StepForm", ->
  s = null

  describe "#toggleStep", ->
    beforeEach ->
      s = new StepForm('.step-form', '.step-form-button')

      spyOn(s, "hideCurrentStep")
      spyOn(s, "displayNextStep")

    describe "calls toggleStep method", ->
      it "calls hideCurrentStep and displayNextStep", ->
        s.toggleStep("#step-2")
        expect(s.hideCurrentStep).toHaveBeenCalled()
        expect(s.displayNextStep).toHaveBeenCalledWith("#step-2")

  describe "#hideCurrentStep", ->
    xit "test with jasmine later", ->
      expect(true).toBe(true)

  describe "#displayNextStep", ->
    xit "test with jasmine later", ->
      expect(true).toBe(true)
