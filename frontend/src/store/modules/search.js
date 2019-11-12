import axios from "axios"

export const search = {
  namespaced: true,
  state: {
    msg: ['テスト1']
  },
  mutations: {
    search(state, data) {
      state.msg.push(data.message)
    }
  },
  actions: {
    async searchArticles({ commit }) {
      const res = await axios.get('http://localhost:5000/api/v1/search')
      commit('search', res.data)
    }
  }
}
