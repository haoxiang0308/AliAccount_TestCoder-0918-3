<template>
  <div>
    <h2>Vue 自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框应该会自动获得焦点" />
    <br />
    <br />
    <input type="text" placeholder="这个不会自动获得焦点" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirective',
  directives: {
    focus: {
      mounted(el) {
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
input {
  padding: 8px;
  margin: 4px;
}
</style>