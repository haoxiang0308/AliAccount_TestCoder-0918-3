import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { DataFetcherService } from './data-fetcher.service';

@NgModule({
  declarations: [
    // Your components here
  ],
  imports: [
    BrowserModule,
    HttpClientModule // Required for HttpClient
  ],
  providers: [
    DataFetcherService
  ],
  bootstrap: [
    // Your main component here
  ]
})
export class AppModule { }