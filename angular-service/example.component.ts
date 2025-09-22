import { Component, OnInit } from '@angular/core';
import { DataFetcherService, DataItem } from './data-fetcher.service';

@Component({
  selector: 'app-example',
  template: `
    <h2>Data List</h2>
    <ul>
      <li *ngFor="let item of dataItems">
        {{ item.id }} - {{ item.name }}
      </li>
    </ul>
    <button (click)="fetchData()">Fetch Data</button>
  `
})
export class ExampleComponent implements OnInit {
  dataItems: DataItem[] = [];

  constructor(private dataService: DataFetcherService) { }

  ngOnInit(): void {
    // Optionally fetch data on component initialization
    // this.fetchData();
  }

  fetchData(): void {
    this.dataService.getData().subscribe(
      (data) => {
        this.dataItems = data;
      },
      (error) => {
        console.error('Error fetching data:', error);
      }
    );
  }
}