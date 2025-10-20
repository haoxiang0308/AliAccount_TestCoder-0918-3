<template>
  <div class="login-container">
    <form @submit.prevent="handleSubmit" class="login-form">
      <h2>Вход в систему</h2>
      
      <div class="form-group">
        <label for="email">Email:</label>
        <input 
          type="email" 
          id="email" 
          v-model="email" 
          required 
          placeholder="Введите ваш email"
          :class="{ 'error': errors.email }"
        />
        <span v-if="errors.email" class="error-message">{{ errors.email }}</span>
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="password" 
          required 
          placeholder="Введите ваш пароль"
          :class="{ 'error': errors.password }"
        />
        <span v-if="errors.password" class="error-message">{{ errors.password }}</span>
      </div>
      
      <div class="form-group">
        <button type="submit" :disabled="loading" class="submit-btn">
          {{ loading ? 'Вход...' : 'Войти' }}
        </button>
      </div>
      
      <div v-if="error" class="error-message general-error">
        {{ error }}
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'LoginForm',
  data() {
    return {
      email: '',
      password: '',
      loading: false,
      error: '',
      errors: {}
    }
  },
  methods: {
    validateForm() {
      const newErrors = {}
      
      if (!this.email) {
        newErrors.email = 'Email обязателен'
      } else if (!/\S+@\S+\.\S+/.test(this.email)) {
        newErrors.email = 'Email некорректен'
      }
      
      if (!this.password) {
        newErrors.password = 'Пароль обязателен'
      } else if (this.password.length < 6) {
        newErrors.password = 'Пароль должен содержать не менее 6 символов'
      }
      
      this.errors = newErrors
      return Object.keys(newErrors).length === 0
    },
    
    async handleSubmit() {
      if (!this.validateForm()) {
        return
      }
      
      this.loading = true
      this.error = ''
      
      try {
        // Здесь должна быть логика аутентификации
        // await this.login(this.email, this.password)
        console.log('Login attempt with:', { email: this.email, password: this.password })
        
        // Имитация асинхронного запроса
        await new Promise(resolve => setTimeout(resolve, 1000))
        
        // В реальном приложении здесь будет проверка ответа от сервера
        alert(`Успешный вход! Добро пожаловать, ${this.email}`)
      } catch (err) {
        this.error = 'Ошибка входа. Проверьте данные и попробуйте снова.'
        console.error('Login error:', err)
      } finally {
        this.loading = false
      }
    }
  }
}
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
}

.login-form {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

h2 {
  text-align: center;
  margin-bottom: 1.5rem;
  color: #333;
}

.form-group {
  margin-bottom: 1rem;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
  color: #555;
}

input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  transition: border-color 0.3s;
  box-sizing: border-box;
}

input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

input.error {
  border-color: #dc3545;
}

.error-message {
  color: #dc3545;
  font-size: 0.875rem;
  margin-top: 0.25rem;
  display: block;
}

.general-error {
  background-color: #f8d7da;
  border: 1px solid #f5c6cb;
  color: #721c24;
  padding: 0.75rem;
  border-radius: 4px;
  margin-top: 1rem;
}

.submit-btn {
  width: 100%;
  padding: 0.75rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.3s;
}

.submit-btn:hover:not(:disabled) {
  background-color: #0056b3;
}

.submit-btn:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
}
</style>