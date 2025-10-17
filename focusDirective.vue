<template>
  <div>
    <h2>Vue 自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框应该自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个输入框没有自动聚焦" />
    <br><br>
    <input v-focus-delay="1000" type="text" placeholder="这个输入框将在1秒后获得焦点" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    // 自定义聚焦指令
    focus: {
      mounted(el) {
        el.focus();
      }
    },
    // 带延迟的聚焦指令
    'focus-delay': {
      mounted(el, binding) {
        setTimeout(() => {
          el.focus();
        }, binding.value || 0);
      }
    }
  }
}
</script>

<style scoped>
input {
  padding: 8px;
  margin: 5px;
  border: 2px solid #ccc;
  border-radius: 4px;
}
input:focus {
  border-color: #409eff;
  outline: none;
}
</style>