// Имитация Angular-сервиса для получения данных через HTTP
class DataFetchService {
  constructor() {
    // В Angular это был бы HttpClient
    this.http = this._createMockHttpClient();
  }

  _createMockHttpClient() {
    // Имитация HttpClient
    return {
      get: (url) => {
        return new Promise((resolve) => {
          // Имитация асинхронного HTTP-запроса
          setTimeout(() => {
            // Пример ответа
            resolve({ data: `Mock data fetched from ${url}` });
          }, 100);
        });
      }
    };
  }

  async fetchData(url) {
    try {
      const response = await this.http.get(url);
      return response.data;
    } catch (error) {
      console.error('Error fetching data:', error);
      throw error;
    }
  }
}

// Экспорт класса для демонстрации
module.exports = { DataFetchService };