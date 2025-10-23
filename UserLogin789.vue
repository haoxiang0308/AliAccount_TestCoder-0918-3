<template>
  <div class="login-wrapper">
    <div class="login-card">
      <h2 class="login-title">Вход в аккаунт</h2>
      
      <form @submit.prevent="onSubmit" class="login-form">
        <div class="input-group">
          <label for="username">Имя пользователя или Email</label>
          <input 
            type="text" 
            id="username" 
            v-model="credentials.username" 
            :class="{ 'error': errors.username }"
            placeholder="Введите имя пользователя или email"
            required
          />
          <span v-if="errors.username" class="error-text">{{ errors.username }}</span>
        </div>
        
        <div class="input-group">
          <label for="password">Пароль</label>
          <input 
            type="password" 
            id="password" 
            v-model="credentials.password" 
            :class="{ 'error': errors.password }"
            placeholder="Введите пароль"
            required
          />
          <span v-if="errors.password" class="error-text">{{ errors.password }}</span>
        </div>
        
        <div class="checkbox-group">
          <label class="checkbox-label">
            <input 
              type="checkbox" 
              v-model="credentials.rememberMe"
            />
            Запомнить меня
          </label>
        </div>
        
        <button 
          type="submit" 
          class="login-button"
          :disabled="loading"
        >
          <span v-if="loading">Вход...</span>
          <span v-else>Войти</span>
        </button>
        
        <div v-if="errorMessage" class="server-error">
          {{ errorMessage }}
        </div>
      </form>
      
      <div class="login-footer">
        <a href="#" @click.prevent="forgotPassword">Забыли пароль?</a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'UserLogin',
  data() {
    return {
      credentials: {
        username: '',
        password: '',
        rememberMe: false
      },
      errors: {},
      errorMessage: '',
      loading: false
    }
  },
  methods: {
    async onSubmit() {
      // Reset errors
      this.errors = {};
      this.errorMessage = '';
      
      // Basic validation
      let valid = true;
      if (!this.credentials.username) {
        this.errors.username = 'Это поле обязательно';
        valid = false;
      }
      
      if (!this.credentials.password) {
        this.errors.password = 'Это поле обязательно';
        valid = false;
      }
      
      if (!valid) return;
      
      // Set loading state
      this.loading = true;
      
      try {
        // Simulate API call
        await new Promise(resolve => setTimeout(resolve, 1500));
        
        // Mock authentication
        if (this.credentials.username === 'admin' && this.credentials.password === 'admin') {
          this.$emit('login-success', { ...this.credentials });
          console.log('Login successful', this.credentials);
        } else {
          this.errorMessage = 'Неправильное имя пользователя или пароль';
        }
      } catch (error) {
        this.errorMessage = 'Ошибка при попытке входа. Попробуйте позже.';
      } finally {
        this.loading = false;
      }
    },
    
    forgotPassword() {
      this.$emit('forgot-password');
    }
  }
}
</script>

<style scoped>
.login-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
  padding: 20px;
}

.login-card {
  background: white;
  border-radius: 10px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
  width: 100%;
  max-width: 450px;
  padding: 30px;
}

.login-title {
  text-align: center;
  margin-bottom: 30px;
  color: #333;
  font-size: 24px;
}

.login-form {
  display: flex;
  flex-direction: column;
}

.input-group {
  margin-bottom: 20px;
}

.input-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 500;
  color: #555;
}

.input-group input {
  width: 100%;
  padding: 12px 15px;
  border: 1px solid #ddd;
  border-radius: 6px;
  font-size: 16px;
  transition: border-color 0.3s;
  box-sizing: border-box;
}

.input-group input:focus {
  outline: none;
  border-color: #42b983;
  box-shadow: 0 0 0 2px rgba(66, 185, 131, 0.2);
}

.input-group input.error {
  border-color: #e74c3c;
}

.error-text {
  color: #e74c3c;
  font-size: 14px;
  margin-top: 5px;
  display: block;
}

.checkbox-group {
  margin-bottom: 20px;
}

.checkbox-label {
  display: flex;
  align-items: center;
  font-size: 14px;
  color: #666;
  cursor: pointer;
}

.checkbox-label input {
  margin-right: 8px;
}

.login-button {
  background-color: #42b983;
  color: white;
  border: none;
  padding: 14px;
  border-radius: 6px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.3s;
  margin-bottom: 15px;
}

.login-button:hover:not(:disabled) {
  background-color: #369c6d;
}

.login-button:disabled {
  background-color: #a3d9c3;
  cursor: not-allowed;
}

.server-error {
  background-color: #ffebee;
  color: #c62828;
  padding: 12px;
  border-radius: 6px;
  text-align: center;
  margin-top: 15px;
  border: 1px solid #ffcdd2;
}

.login-footer {
  text-align: center;
  margin-top: 20px;
}

.login-footer a {
  color: #42b983;
  text-decoration: none;
  font-size: 14px;
}

.login-footer a:hover {
  text-decoration: underline;
}
</style>