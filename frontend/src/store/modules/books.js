import axios from "axios"

export const books = {
  namespaced: true,
  state: {
    results: []
  },
  mutations: {
    pushList(state, data) {
      state.results = []
      state.results.push(...data)
    }
  },
  actions: {
    async getList({ commit }) {
      const res = await axios.get('http://localhost:5000/api/v1/books')
      commit('pushList', res.data)
    }
  }
}
