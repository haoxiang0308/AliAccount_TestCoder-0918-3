<template>
  <div>
    <h2>Focus Directive Component</h2>
    <input v-focus placeholder="This input uses the local directive" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveComponent',
  directives: {
    focus: {
      mounted(el) {
        el.focus()
      }
    }
  }
}
</script>