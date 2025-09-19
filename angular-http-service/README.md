# Angular HTTP Service with Random Name

This project contains an Angular service for handling HTTP requests with a randomly generated file name.

## Service File
- **Name**: `h8oe5grjgu.service.ts`
- **Location**: `src/app/services/`

## Features
- GET requests (single item and list)
- POST requests
- PUT requests
- DELETE requests

## Usage
1. Import the `HttpClientModule` in your app module:
   ```typescript
   import { HttpClientModule } from '@angular/common/http';
   
   @NgModule({
     imports: [HttpClientModule],
     // ...
   })
   export class AppModule { }
   ```

2. Inject the service in your component:
   ```typescript
   import { H8OE5gRjGUService } from './services/h8oe5grjgu.service';
   
   export class MyComponent {
     constructor(private dataService: H8OE5gRjGUService) { }
     
     fetchData() {
       this.dataService.getData().subscribe(
         (data) => console.log(data),
         (error) => console.error(error)
       );
     }
   }
   ```

## Interface
The service uses a `DataItem` interface:
```typescript
interface DataItem {
  id: number;
  name: string;
  description?: string;
}
```