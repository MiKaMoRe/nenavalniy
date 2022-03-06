import Swiper, { Navigation, Pagination } from "swiper"

class MainPage{
  constructor(){
    this.slider = new Swiper('.swiper', {
      direction: 'horizontal',
      loop: true,
      modules: [Navigation, Pagination],
      pagination: {
        el: '.swiper-pagination',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      scrollbar: {
        el: '.swiper-scrollbar',
      },
    })
  }
}

export default MainPage