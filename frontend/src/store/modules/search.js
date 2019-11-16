import axios from "axios"

export const search = {
  namespaced: true,
  state: {
    msg: ['This is default message']
  },
  mutations: {
    search(state, data) {
      state.msg.push(data)
    }
  },
  actions: {
    async searchArticles({ commit }) {
      // const res = await axios.get('http://localhost:5000/api/v1/search')
      const res = { 'data': 'This is dummy response message' }
      console.log(res)
      commit('search', res.data)
    }
  }
}
