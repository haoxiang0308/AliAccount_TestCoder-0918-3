<template>
  <div>
    <h2>Vue 自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会被自动聚焦" />
    <br><br>
    <input type="text" placeholder="这个输入框不会被自动聚焦" />
    <br><br>
    <button @click="focusSecondInput">聚焦第二个输入框</button>
    <input ref="secondInput" type="text" placeholder="点击按钮聚焦这个输入框" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    focus: {
      // 当被绑定的元素插入到 DOM 中时...
      mounted(el) {
        // 聚焦元素
        el.focus();
      }
    }
  },
  methods: {
    focusSecondInput() {
      this.$refs.secondInput.focus();
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
  margin: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

button {
  padding: 8px 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>