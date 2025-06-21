import { createStore } from 'vuex'

export default createStore({
  state: {
    darkTheme: false,
    user: {
      id: '',
      name: '',
      email: '',
      role: ''
    },
    token: localStorage.getItem('token') || '',
  },
   mutations: {
    setUser(state, userData) {
      state.user = userData
    },
    setToken(state, token) {
      state.token = token
      localStorage.setItem('token', token)
    },
    clearUser(state) {
      state.user = {
        id: '',
        name: '',
        email: '',
        role: ''
      }
      state.token = ''
      localStorage.removeItem('token')
    }
  },
  actions: {
    loginUser({ commit }, { userData, token }) {
      commit('setUser', userData)
      commit('setToken', token)
    },
    logout({ commit }) {
      commit('clearUser')
    }
  },
  getters: {
    isAuthenticated: state => !!state.token,
    currentUser: state => state.user
  }
})