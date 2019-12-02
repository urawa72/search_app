import Vue from 'vue'
import Vuex from 'vuex'
import { search } from './modules/search'
import { books } from './modules/books'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    search,
    books
  }
})
