<template>
  <div>
    <input type="text" v-focus placeholder="This input should be focused on mount" />
    <p>Try clicking outside the input. It should be focused again.</p>
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    // 定义一个名为 'focus' 的自定义指令
    focus: {
      // 当被绑定的元素挂载到 DOM 上时...
      mounted(el) {
        // 聚焦元素
        el.focus();
      },
      // 可选：每次元素更新时触发
      updated(el) {
        // 为了演示目的，每次更新时也聚焦
        // 在实际应用中，通常只在 mounted 钩子中操作
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
input {
  padding: 8px;
  margin: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>