import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { NguoiDangKiXe } from 'app/models/nguoiDangKiXe.model';

@Injectable({
  providedIn: 'root',
})
export class NguoiDangKiXeService {
  private header: HttpHeaders = new HttpHeaders().set('Content-Type', 'application/json');
  constructor(private http: HttpClient) {}
  getByIdentityCard(id: string): Observable<NguoiDangKiXe> {
    return this.http.get<NguoiDangKiXe>('http://localhost:59460/api/NguoiDangKyXe?identityCard=' + id, {
      headers: this.header,
    });
  }
}
