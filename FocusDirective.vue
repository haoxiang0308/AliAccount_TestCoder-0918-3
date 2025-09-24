<template>
  <div>
    <h1>Vue 自定义指令示例</h1>
    <input v-focus type="text" placeholder="这个输入框会自动获得焦点" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirective',
  directives: {
    // 定义一个名为 'focus' 的局部自定义指令
    focus: {
      // 当被绑定的元素挂载到 DOM 上时...
      mounted(el) {
        // 聚焦元素
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
div {
  padding: 20px;
}

input {
  padding: 8px;
  font-size: 16px;
}
</style>