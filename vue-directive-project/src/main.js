import { createApp } from 'vue'
import App from './App.vue'

const app = createApp(App)

// Register the custom directive globally
app.directive('focus', {
  mounted(el) {
    el.focus()
  }
})

app.mount('#app')