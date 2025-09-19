<template>
  <div class="login-form">
    <h2>Вход в систему</h2>
    <form @submit.prevent="handleSubmit">
      <div class="form-group">
        <label for="username">Имя пользователя:</label>
        <input 
          type="text" 
          id="username" 
          v-model="formData.username" 
          required 
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="formData.password" 
          required 
        />
      </div>
      
      <button type="submit">Войти</button>
      
      <div v-if="errorMessage" class="error">
        {{ errorMessage }}
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'LoginForm',
  data() {
    return {
      formData: {
        username: '',
        password: ''
      },
      errorMessage: ''
    }
  },
  methods: {
    handleSubmit() {
      // Простая валидация
      if (!this.formData.username || !this.formData.password) {
        this.errorMessage = 'Пожалуйста, заполните все поля';
        return;
      }
      
      // Сброс ошибки
      this.errorMessage = '';
      
      // Здесь можно добавить логику аутентификации
      console.log('Попытка входа:', this.formData);
      
      // Эмитируем отправку данных на сервер
      this.$emit('login', this.formData);
    }
  }
}
</script>

<style scoped>
.login-form {
  max-width: 400px;
  margin: 50px auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

button:hover {
  background-color: #0056b3;
}

.error {
  margin-top: 15px;
  padding: 10px;
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
  border-radius: 4px;
}
</style>