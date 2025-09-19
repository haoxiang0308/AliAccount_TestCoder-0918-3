<template>
  <div>
    <p>这是一个自定义指令聚焦输入框的示例：</p>
    <input v-focus class="input-box" type="text" placeholder="这个输入框会自动聚焦" />
    <p>下面是一个不会自动聚焦的普通输入框：</p>
    <input class="input-box" type="text" placeholder="这个输入框需要手动点击" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveDemo'
}
</script>

<style scoped>
.input-box {
  display: block;
  margin: 10px 0;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>