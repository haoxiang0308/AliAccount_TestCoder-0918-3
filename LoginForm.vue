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
        />
      </div>
      
      <div class="form-group checkbox-group">
        <input 
          type="checkbox" 
          id="remember" 
          v-model="rememberMe"
        />
        <label for="remember">Запомнить меня</label>
      </div>
      
      <button type="submit" :disabled="loading" class="submit-btn">
        {{ loading ? 'Вход...' : 'Войти' }}
      </button>
      
      <div class="form-footer">
        <a href="#" @click.prevent="handleForgotPassword">Забыли пароль?</a>
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
      rememberMe: false,
      loading: false
    }
  },
  methods: {
    async handleSubmit() {
      // Проверка валидности формы
      if (!this.email || !this.password) {
        alert('Пожалуйста, заполните все поля');
        return;
      }
      
      this.loading = true;
      
      try {
        // Здесь будет логика аутентификации
        console.log('Попытка входа с:', {
          email: this.email,
          password: this.password,
          rememberMe: this.rememberMe
        });
        
        // Имитация API запроса
        await new Promise(resolve => setTimeout(resolve, 1500));
        
        // В реальном приложении здесь будет вызов API
        alert(`Добро пожаловать, ${this.email}!`);
      } catch (error) {
        console.error('Ошибка входа:', error);
        alert('Произошла ошибка при входе. Пожалуйста, попробуйте снова.');
      } finally {
        this.loading = false;
      }
    },
    handleForgotPassword() {
      // Логика восстановления пароля
      alert('Функция восстановления пароля будет реализована позже');
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
  padding: 20px;
}

.login-form {
  background: white;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

.login-form h2 {
  text-align: center;
  margin-bottom: 24px;
  color: #333;
}

.form-group {
  margin-bottom: 16px;
}

.form-group label {
  display: block;
  margin-bottom: 6px;
  font-weight: bold;
  color: #555;
}

.form-group input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
  box-sizing: border-box;
}

.form-group input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

.checkbox-group {
  display: flex;
  align-items: center;
}

.checkbox-group input {
  width: auto;
  margin-right: 8px;
}

.checkbox-group label {
  margin-bottom: 0;
  margin-right: 8px;
  font-weight: normal;
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
  margin-top: 10px;
}

.submit-btn:hover:not(:disabled) {
  background-color: #0069d9;
}

.submit-btn:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
}

.form-footer {
  text-align: center;
  margin-top: 16px;
}

.form-footer a {
  color: #007bff;
  text-decoration: none;
}

.form-footer a:hover {
  text-decoration: underline;
}
</style>