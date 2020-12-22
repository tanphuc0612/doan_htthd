import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  isAuthorized = false;
  popup: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(JSON.parse(JSON.stringify(sessionStorage.getItem('user'))) === 'login');
  constructor() {
    if (sessionStorage.getItem('user')) {
      this.isAuthorized = true;
    }
  }
  login(): void {
    sessionStorage.setItem('user', 'login');
    this.isAuthorized = true;
    this.popup.next(true);
  }
  logout(): void {
    sessionStorage.removeItem('user');
    this.isAuthorized = false;
    this.popup.next(false);
  }
}
