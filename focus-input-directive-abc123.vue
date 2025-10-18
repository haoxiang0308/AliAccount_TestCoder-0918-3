<template>
  <div class="container">
    <h2>Vue Focus Input Directive Demo</h2>
    <input v-focus type="text" placeholder="This input will be focused automatically" />
    <br><br>
    <input type="text" placeholder="This input will NOT be focused" />
    <br><br>
    <input v-focus="focusCondition" type="text" placeholder="Conditional focus (will be focused based on data)" />
  </div>
</template>

<script>
export default {
  name: 'FocusInputDemo',
  directives: {
    // 定义聚焦指令
    focus: {
      // 当被绑定元素挂载到 DOM 中时...
      mounted(el, binding) {
        // 聚焦元素
        if (binding.value !== false) {
          el.focus();
        }
      },
      // 当绑定值更新时...
      updated(el, binding) {
        if (binding.value) {
          el.focus();
        }
      }
    }
  },
  data() {
    return {
      focusCondition: true
    }
  }
}
</script>

<style scoped>
.container {
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