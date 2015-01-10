#= require StepProgressBar

describe 'StepProgressBar', ->
  describe '#setCurrentStep', ->
    s = null

    describe 'default @totalStep = 3', ->
      beforeEach ->
        s = new StepProgressBar('.progressbar')

        spyOn(s, '__setState')

      describe 'valid step number', ->
        it "calls __setState with value 0% for step 1", ->
          s.setCurrentStep(1)
          expect(s.__setState).toHaveBeenCalledWith('0%')

        it "calls __setState with value 50% for step 2", ->
          s.setCurrentStep(2)
          expect(s.__setState).toHaveBeenCalledWith('50%')

        it "calls __setState with value 100% for step 3", ->
          s.setCurrentStep(3)
          expect(s.__setState).toHaveBeenCalledWith('100%')

      describe 'invalid step number', ->
        it "calls __setState with value 0% for step < 0", ->
          s.setCurrentStep(-1)
          expect(s.__setState).toHaveBeenCalledWith('0%')

        it "calls __setState with value 0% for step > @totalStep", ->
          s.setCurrentStep(4)
          expect(s.__setState).toHaveBeenCalledWith('0%')

    describe 'custom @totalStep = 5', ->
      beforeEach ->
        s = new StepProgressBar('.progressbar', 5)

        spyOn(s, '__setState')

      describe 'valid step number', ->
        it "calls __setState with value 0% for step 1", ->
          s.setCurrentStep(1)
          expect(s.__setState).toHaveBeenCalledWith('0%')

        it "calls __setState with value 50% for step 2", ->
          s.setCurrentStep(2)
          expect(s.__setState).toHaveBeenCalledWith('25%')

        it "calls __setState with value 100% for step 5", ->
          s.setCurrentStep(5)
          expect(s.__setState).toHaveBeenCalledWith('100%')

      describe 'invalid step number', ->
        it "calls __setState with value 0% for step < 0", ->
          s.setCurrentStep(-1)
          expect(s.__setState).toHaveBeenCalledWith('0%')

        it "calls __setState with value 0% for step > @totalStep", ->
          s.setCurrentStep(6)
          expect(s.__setState).toHaveBeenCalledWith('0%')

