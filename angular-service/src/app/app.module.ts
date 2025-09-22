import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

// Import our service
import { DataService7PQkPzXi4Y } from './services/data-service-7PQkPzXi4Y';

@NgModule({
  declarations: [
    // Components would be declared here
  ],
  imports: [
    BrowserModule,
    HttpClientModule // Import HttpClientModule to enable HTTP requests
  ],
  providers: [
    DataService7PQkPzXi4Y // Register our service
  ],
  bootstrap: [
    // Main component would be bootstrapped here
  ]
})
export class AppModule { }