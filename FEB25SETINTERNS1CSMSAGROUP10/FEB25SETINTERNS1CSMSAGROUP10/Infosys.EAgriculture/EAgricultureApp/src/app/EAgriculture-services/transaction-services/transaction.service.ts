import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, catchError, throwError } from 'rxjs';
import { IFarmerTransactionHistory } from '../../EAgriculture-interfaces/farmerTransactionHistory';

@Injectable({
  providedIn: 'root'
})
export class TransactionService {

  constructor(private _http: HttpClient) { }

  getFarmerTransactionHistory(): Observable<IFarmerTransactionHistory[]> {

  }
}
