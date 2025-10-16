<template>
  <div>
    <h2>Vue 自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个输入框不会自动获得焦点" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    // 定义一个名为 'focus' 的自定义指令
    focus: {
      // 当被绑定的元素挂载到 DOM 中时...
      mounted(el) {
        // 聚焦元素
        el.focus()
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
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>