<template>
  <div class="login-form-container">
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
          class="form-input"
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="password" 
          required 
          placeholder="Введите ваш пароль"
          class="form-input"
        />
      </div>
      
      <div class="form-group checkbox-group">
        <label for="remember">
          <input 
            type="checkbox" 
            id="remember" 
            v-model="rememberMe"
            class="form-checkbox"
          />
          Запомнить меня
        </label>
      </div>
      
      <button type="submit" class="submit-btn" :disabled="!isValid">
        Войти
      </button>
      
      <div class="form-footer">
        <a href="#" @click.prevent="forgotPassword">Забыли пароль?</a>
      </div>
    </form>
    
    <div v-if="error" class="error-message">
      {{ error }}
    </div>
  </div>
</template>

<script>
export default {
  name: 'LoginForm',
  data() {
    return {
      email: '',
      password: '',
      rememberMe: false,
      error: ''
    }
  },
  computed: {
    isValid() {
      // Проверяем, что email имеет правильный формат и пароль не пустой
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
      return emailRegex.test(this.email) && this.password.length > 0
    }
  },
  methods: {
    async handleSubmit() {
      // Сброс ошибки при новой попытке входа
      this.error = ''
      
      try {
        // Здесь должна быть логика аутентификации
        // Например, вызов API для проверки учетных данных
        await this.loginUser(this.email, this.password, this.rememberMe)
        
        // При успешном входе можно эмитировать событие
        this.$emit('login-success', { email: this.email, rememberMe: this.rememberMe })
      } catch (err) {
        this.error = err.message || 'Ошибка входа. Пожалуйста, проверьте учетные данные.'
      }
    },
    async loginUser(email, password, rememberMe) {
      // Заглушка для аутентификации
      // В реальном приложении здесь будет вызов API
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          if (email === 'user@example.com' && password === 'password') {
            resolve({ success: true })
          } else {
            reject(new Error('Неверный email или пароль'))
          }
        }, 500)
      })
    },
    forgotPassword() {
      // Логика восстановления пароля
      this.$emit('forgot-password')
    }
  }
}
</script>

<style scoped>
.login-form-container {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.login-form h2 {
  text-align: center;
  margin-bottom: 20px;
  color: #333;
}

.form-group {
  margin-bottom: 15px;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #555;
}

.form-input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 16px;
  box-sizing: border-box;
}

.form-input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
}

.checkbox-group {
  display: flex;
  align-items: center;
}

.checkbox-group input {
  margin-right: 8px;
}

.submit-btn {
  width: 100%;
  padding: 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.submit-btn:hover:not(:disabled) {
  background-color: #0056b3;
}

.submit-btn:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

.form-footer {
  text-align: center;
  margin-top: 15px;
}

.form-footer a {
  color: #007bff;
  text-decoration: none;
  font-size: 14px;
}

.form-footer a:hover {
  text-decoration: underline;
}

.error-message {
  margin-top: 15px;
  padding: 10px;
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
  border-radius: 4px;
  text-align: center;
}
</style>