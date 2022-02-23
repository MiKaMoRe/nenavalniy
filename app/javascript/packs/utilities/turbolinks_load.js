$(document).on('turbolinks:load', () => {
  const popup = {
    signIp: 0,
    signUn: 1
  }

  $('.popup-login').magnificPopup({
    closeOnBgClick: false,

    gallery: {
      enabled: false,
    },

    callbacks: {
      open: () => $('.mfp-arrow').hide()
    }
  })

  $('.popup-nav-signup').on('click', e => {
    $.magnificPopup.instance.goTo(popup.signUn)
  })

  $('.popup-nav-login').on('click', e => {
    $.magnificPopup.instance.goTo(popup.signIp)
  })
})
