import { createStore } from 'vuex'

export default createStore({
  state: {
    darkTheme: false
  },
  mutations: {
    toggleTheme(state) {
      state.darkTheme = !state.darkTheme
    }
  },
  actions: {},
  modules: {}
})
