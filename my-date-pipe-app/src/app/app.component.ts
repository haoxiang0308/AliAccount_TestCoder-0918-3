import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
    <h1>Date Pipe Example</h1>
    <p>Default format: {{ today | formatDate }}</p>
    <p>DD/MM/YYYY: {{ today | formatDate:'dd/MM/yyyy' }}</p>
    <p>MM/DD/YYYY: {{ today | formatDate:'MM/dd/yyyy' }}</p>
    <p>Long date: {{ today | formatDate:'longDate' }}</p>
    <p>Invalid date: {{ invalidDate | formatDate }}</p>
  `,
  styles: []
})
export class AppComponent {
  title = 'my-date-pipe-app';
  today = new Date();
  invalidDate = 'not-a-date';
}