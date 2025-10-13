<template>
  <div>
    <input v-focus type="text" placeholder="This input will be focused on mount" />
    <input type="text" placeholder="This input will NOT be focused" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
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
div {
  padding: 20px;
}
input {
  display: block;
  margin: 10px 0;
  padding: 8px;
}
</style>