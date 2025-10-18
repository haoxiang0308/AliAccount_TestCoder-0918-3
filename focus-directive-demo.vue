<template>
  <div class="focus-demo">
    <h2>Vue 自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个输入框没有自动聚焦" />
    <br><br>
    <input v-focus-once type="text" placeholder="这个输入框只在首次渲染时聚焦" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveDemo',
  directives: {
    // 自定义聚焦指令 - 每次插入都会聚焦
    focus: {
      mounted(el) {
        el.focus();
      }
    },
    // 自定义聚焦指令 - 只在首次插入时聚焦
    focusOnce: {
      mounted(el) {
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
.focus-demo {
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