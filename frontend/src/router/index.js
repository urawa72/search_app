import Vue from 'vue'
import Router from 'vue-router'
import Message from '../pages/Message'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Message',
      component: Message
    }
  ]
})
