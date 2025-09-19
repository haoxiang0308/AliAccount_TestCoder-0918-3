import { createApp } from 'vue'
import FocusDirectiveDemo from './FocusDirectiveDemo.vue'

// 创建自定义指令
const focusDirective = {
  mounted(el) {
    el.focus()
  }
}

const app = createApp(FocusDirectiveDemo)

// 注册全局自定义指令
app.directive('focus', focusDirective)

app.mount('#app')