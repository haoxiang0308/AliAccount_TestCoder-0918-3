// Example usage in an Angular component
import { Component } from '@angular/core';

@Component({
  selector: 'app-example',
  template: `
    <div>
      <h3>Date Formatting Examples</h3>
      <p>Default format: {{ currentDate | dateFormat }}</p>
      <p>yyyy-MM-dd: {{ currentDate | dateFormat:'yyyy-MM-dd' }}</p>
      <p>dd/MM/yyyy: {{ currentDate | dateFormat:'dd/MM/yyyy' }}</p>
      <p>MM/dd/yyyy: {{ currentDate | dateFormat:'MM/dd/yyyy' }}</p>
      <p>Full date and time: {{ currentDate | dateFormat:'full' }}</p>
    </div>
  `
})
export class ExampleComponent {
  currentDate = new Date();
  
  constructor() {
    // For demo purposes, we're setting a specific date
    this.currentDate = new Date('2023-05-15T14:30:00');
  }
}