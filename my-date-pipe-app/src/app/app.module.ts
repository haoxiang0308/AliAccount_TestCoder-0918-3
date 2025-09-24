import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { FormatDatePipe } from './format-date.pipe'; // Import the new pipe

@NgModule({
  declarations: [
    AppComponent,
    FormatDatePipe // Add the pipe to the declarations array
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }