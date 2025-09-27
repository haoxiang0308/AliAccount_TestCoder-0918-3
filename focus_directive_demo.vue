<template>
  <div>
    <input type="text" v-focus placeholder="This input should be focused on mount" />
    <p>See? The input above should be focused when the component loads.</p>
  </div>
</template>

<script setup>
// Define the custom directive
const vFocus = {
  mounted: (el) => el.focus(),
}
</script>

<style scoped>
input {
  padding: 8px;
  margin: 10px;
  border: 2px solid #42b883;
  border-radius: 4px;
}

input:focus {
  outline: 2px solid #34495e;
}
</style>

</template>