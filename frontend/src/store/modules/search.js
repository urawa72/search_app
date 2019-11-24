import axios from "axios"

export const search = {
  namespaced: true,
  state: {
    results: []
  },
  mutations: {
    search(state, data) {
      state.results = []
      state.results.push(...data)
    }
  },
  actions: {
    async searchBooks({ commit }, keyword) {
      const res = await axios.get(
        'http://localhost:5000/api/v1/books/full_search',
        { params: { keyword: keyword } }
      )
      commit('search', res.data)
    }
  }
}
