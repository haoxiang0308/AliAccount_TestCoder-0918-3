<template>
  <div>
    <h2>Vue Focus Input Directive Example</h2>
    <input 
      type="text" 
      v-focus 
      placeholder="This input will be focused automatically" 
    />
    <br><br>
    <input 
      type="text" 
      v-focus:delay="1000" 
      placeholder="This input will be focused after 1 second" 
    />
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    // 定义一个名为 'focus' 的自定义指令
    focus: {
      // 当被绑定的元素插入到 DOM 中时...
      mounted(el, binding) {
        // 聚焦元素
        if (binding.arg && binding.arg === 'delay') {
          // 如果传递了delay参数，则延迟聚焦
          setTimeout(() => {
            el.focus();
          }, binding.value || 0);
        } else {
          // 直接聚焦
          el.focus();
        }
      }
    }
  }
}
</script>

<style scoped>
input {
  padding: 10px;
  font-size: 16px;
  margin: 5px;
  border: 2px solid #42b983;
  border-radius: 4px;
}

input:focus {
  outline: none;
  box-shadow: 0 0 5px rgba(66, 185, 131, 0.5);
}
</style>