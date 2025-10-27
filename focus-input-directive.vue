<template>
  <div>
    <h2>Vue 自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个输入框不会自动获得焦点" />
    <br><br>
    <input v-focus-if="shouldFocus" type="text" placeholder="条件性聚焦的输入框" />
    <br><br>
    <button @click="toggleFocus">切换条件聚焦</button>
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveDemo',
  directives: {
    // 自定义聚焦指令
    focus: {
      mounted(el) {
        el.focus();
      }
    },
    // 条件性聚焦指令
    focusIf: {
      mounted(el, binding) {
        if (binding.value) {
          el.focus();
        }
      },
      updated(el, binding) {
        if (binding.value) {
          el.focus();
        }
      }
    }
  },
  data() {
    return {
      shouldFocus: false
    };
  },
  methods: {
    toggleFocus() {
      this.shouldFocus = !this.shouldFocus;
    }
  }
};
</script>

<style scoped>
div {
  padding: 20px;
  font-family: Arial, sans-serif;
}
input {
  padding: 8px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
button {
  padding: 8px 16px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
button:hover {
  background-color: #0056b3;
}
</style>