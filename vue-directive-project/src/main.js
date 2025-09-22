import { createApp } from 'vue'
import App from './App.vue'
import focusDirective from './directives/focusDirective'

const app = createApp(App)

app.directive('focus', focusDirective)

app.mount('#app')