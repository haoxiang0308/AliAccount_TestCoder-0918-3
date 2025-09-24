<template>
  <div>
    <h2>Custom Focus Directive Example</h2>
    <input type="text" v-focus placeholder="This input should be focused on render" />
    <br><br>
    <input type="text" placeholder="This input is normal" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    // Define the custom 'focus' directive
    focus: {
      // Directive definition object
      mounted(el) {
        // Focus the element when the directive is attached to it
        el.focus();
      }
    }
  }
}
</script>

<style>
input {
  padding: 8px;
  margin: 4px;
}
</style>