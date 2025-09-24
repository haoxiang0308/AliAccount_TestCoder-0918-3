<template>
  <div>
    <h1>Custom Focus Directive Example</h1>
    <input v-focus type="text" placeholder="This input should be focused on mount" />
    <br><br>
    <input type="text" placeholder="This input is normal" />
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
input {
  padding: 8px;
  margin: 4px;
}
</style>