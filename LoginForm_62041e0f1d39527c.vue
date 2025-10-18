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
      
      <div class="form-group">
        <button type="submit" :disabled="!isValid" class="submit-btn">
          Войти
        </button>
      </div>
      
      <div class="form-group">
        <a href="#" @click.prevent="handleForgotPassword" class="forgot-password">
          Забыли пароль?
        </a>
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
      password: ''
    }
  },
  computed: {
    isValid() {
      // Email validation: basic check for @ and .
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
      return emailRegex.test(this.email) && this.password.length >= 6
    }
  },
  methods: {
    handleSubmit() {
      if (this.isValid) {
        // In a real application, you would send the login request here
        console.log('Login attempt with:', { email: this.email, password: this.password })
        
        // Emit a custom event with login data
        this.$emit('login', { email: this.email, password: this.password })
      }
    },
    handleForgotPassword() {
      // Handle forgot password logic
      console.log('Forgot password clicked')
      this.$emit('forgot-password')
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

.form-group {
  margin-bottom: 1rem;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
  color: #333;
}

input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  box-sizing: border-box;
}

input:focus {
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
}

.submit-btn:hover:not(:disabled) {
  background-color: #0069d9;
}

.submit-btn:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

.forgot-password {
  display: block;
  text-align: center;
  color: #007bff;
  text-decoration: none;
  margin-top: 1rem;
}

.forgot-password:hover {
  text-decoration: underline;
}
</style>