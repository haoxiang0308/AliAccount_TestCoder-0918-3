<template>
  <div class="login-form-container">
    <form @submit.prevent="handleSubmit" class="login-form">
      <h2>Вход в систему</h2>
      
      <div class="form-group">
        <label for="email">Email:</label>
        <input 
          id="email"
          type="email" 
          v-model="email" 
          required 
          placeholder="Введите ваш email"
          class="form-input"
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          id="password"
          type="password" 
          v-model="password" 
          required 
          placeholder="Введите ваш пароль"
          class="form-input"
        />
      </div>
      
      <button type="submit" :disabled="isSubmitting" class="submit-btn">
        {{ isSubmitting ? 'Вход...' : 'Войти' }}
      </button>
      
      <div v-if="error" class="error-message">
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
      isSubmitting: false,
      error: ''
    }
  },
  methods: {
    async handleSubmit() {
      this.isSubmitting = true;
      this.error = '';
      
      try {
        // Здесь будет логика аутентификации
        // Например, вызов API для проверки учетных данных
        await this.loginUser(this.email, this.password);
        
        // Если вход успешен, можно эмитировать событие
        this.$emit('login-success', { email: this.email });
      } catch (err) {
        this.error = err.message || 'Ошибка входа. Проверьте учетные данные.';
      } finally {
        this.isSubmitting = false;
      }
    },
    
    // Заглушка для функции входа
    async loginUser(email, password) {
      // В реальном приложении здесь будет вызов API
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          if (email && password && password.length >= 6) {
            resolve({ success: true });
          } else {
            reject(new Error('Неверный email или пароль'));
          }
        }, 1000);
      });
    }
  }
}
</script>

<style scoped>
.login-form-container {
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

.form-group {
  margin-bottom: 1rem;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
  color: #333;
}

.form-input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  box-sizing: border-box;
}

.form-input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
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
  transition: background-color 0.2s;
}

.submit-btn:hover:not(:disabled) {
  background-color: #0069d9;
}

.submit-btn:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
}

.error-message {
  margin-top: 1rem;
  padding: 0.75rem;
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
  border-radius: 4px;
  text-align: center;
}
</style>