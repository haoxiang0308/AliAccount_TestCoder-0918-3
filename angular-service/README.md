# Angular HTTP Service

This project contains an Angular service for handling HTTP requests.

## Files

- `src/app/services/data-service-7PQkPzXi4Y.ts`: The main service file with random name
- `src/app/app.module.ts`: Example module showing how to import and provide the service

## Service Features

The service includes methods for:
- Fetching data (GET)
- Fetching a single item by ID (GET)
- Adding new data (POST)
- Updating existing data (PUT)
- Deleting data (DELETE)

## Usage

1. Import `HttpClientModule` in your app module
2. Import and inject the service in your components
3. Call the service methods to perform HTTP operations

Example:
```typescript
import { DataService7PQkPzXi4Y, DataItem } from './services/data-service-7PQkPzXi4Y';

@Component({...})
export class MyComponent {
  constructor(private dataService: DataService7PQkPzXi4Y) {}

  loadData() {
    this.dataService.getData().subscribe(
      (data: DataItem[]) => console.log(data),
      (error) => console.error(error)
    );
  }
}
```