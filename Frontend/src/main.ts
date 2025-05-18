import './assets/main.css'
import '@mdi/font/css/materialdesignicons.css'
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'


const app = createApp(App)
app.use(router).use(store).use(vuetify)
app.mount('#app')
