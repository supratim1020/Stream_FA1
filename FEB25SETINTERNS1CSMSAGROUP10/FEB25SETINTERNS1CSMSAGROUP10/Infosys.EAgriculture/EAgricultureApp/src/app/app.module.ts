import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { ViewTransactionHistoryComponent } from './view-transaction-history/view-transaction-history.component';

@NgModule({
  declarations: [
    AppComponent,
    ViewTransactionHistoryComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
