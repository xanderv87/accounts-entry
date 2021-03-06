Router.map ->

  @route "entrySignIn",
    path: "/sign-in"
    before: ->
      Session.set('entryError', undefined)
      Session.set('buttonText', 'in')

  @route "entrySignUp",
    path: "/sign-up"
    before: ->
      if AccountsEntry.settings.entrySignUp
        Session.set('entryError', undefined)
        Session.set('buttonText', 'up')
      else
        @render 'entrySignIn'
        Router.go AccountsEntry.settings.homeRoute
        @stop()

  @route "entryForgotPassword",
    path: "/forgot-password"
    before: ->
      Session.set('entryError', undefined)

  @route 'entrySignOut',
    path: '/sign-out'
    before: ->
      Session.set('entryError', undefined)
      if AccountsEntry.settings.homeRoute
        Meteor.logout () ->
          Router.go AccountsEntry.settings.homeRoute
      @stop()

  @route 'entryResetPassword',
    path: 'reset-password/:resetToken'
    before: ->
      Session.set('entryError', undefined)
      Session.set('resetToken', @params.resetToken)
