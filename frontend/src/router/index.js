import Vue from 'vue'
import Router from 'vue-router'
import Home from 'pages/Home'
import BookList from 'pages/BookList'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/list',
      name: 'BookList',
      component: BookList
    }
  ]
})
