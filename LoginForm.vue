<template>
  <div class="login-form-container">
    <form @submit.prevent="onSubmit" class="login-form">
      <h2>Вход</h2>
      <div class="form-group">
        <label for="username">Имя пользователя:</label>
        <input
          type="text"
          id="username"
          v-model="username"
          required
          :class="{ 'error': v$.username.$error }"
        />
        <div v-if="v$.username.$error" class="error-message">
          {{ v$.username.$invalid ? 'Имя пользователя обязательно.' : '' }}
        </div>
      </div>
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input
          type="password"
          id="password"
          v-model="password"
          required
          :class="{ 'error': v$.password.$error }"
        />
        <div v-if="v$.password.$error" class="error-message">
          {{ v$.password.$invalid ? 'Пароль обязателен.' : '' }}
        </div>
      </div>
      <button type="submit" :disabled="v$.$invalid">Войти</button>
      <div v-if="loginError" class="error-message">
        {{ loginError }}
      </div>
    </form>
  </div>
</template>

<script>
import { useVuelidate } from '@vuelidate/core'
import { required } from '@vuelidate/validators'

export default {
  name: 'LoginForm',
  setup () {
    return { v$: useVuelidate() }
  },
  data() {
    return {
      username: '',
      password: '',
      loginError: ''
    }
  },
  validations() {
    return {
      username: { required },
      password: { required }
    }
  },
  methods: {
    async onSubmit() {
      // Простая проверка для демонстрации
      if (this.username === 'admin' && this.password === 'password') {
        alert('Успешный вход!')
        this.loginError = '';
        // Здесь можно реализовать логику сохранения токена и т.д.
      } else {
        this.loginError = 'Неверное имя пользователя или пароль.';
      }
    }
  }
}
</script>

<style scoped>
.login-form-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f0f0f0;
}

.login-form {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

.form-group {
  margin-bottom: 1rem;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input.error {
  border-color: #ff0000;
}

.error-message {
  color: #ff0000;
  font-size: 0.875rem;
  margin-top: 0.25rem;
}

button {
  width: 100%;
  padding: 0.75rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
}

button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}
</style>