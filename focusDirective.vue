<template>
  <div>
    <h2>Vue Focus Directive Example</h2>
    <input v-focus type="text" placeholder="This input will be focused automatically" />
    <br><br>
    <input type="text" placeholder="This input will not be focused automatically" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    // 自定义聚焦指令
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
  font-family: Arial, sans-serif;
}
input {
  padding: 8px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>