import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Taikhoan } from 'app/models/taikhoan.model';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  private header: HttpHeaders = new HttpHeaders().set('Content-Type', 'application/json');
  constructor(private http: HttpClient) {}
  getTaikhoan(taikhoan: Taikhoan): Observable<Taikhoan> {
    return this.http.post<Taikhoan>('http://localhost:59460/api/Taikhoan', taikhoan, {
      headers: this.header,
    });
  }
}
