import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { getApplicationURL } from './../../appUtil';
import { CLIENT_URL } from './../../../app.constants';
import { Taikhoan } from 'app/models/taikhoan.model';

@Component({
  selector: 'jhi-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {
  languageData = {
    id: 'language-data',
    label: { class: '', text: '' },
  };

  userData = {
    id: 'user-data',
    label: { class: 'appheader-avatar', text: '' },
    list: [
      { key: 'changePassword', icon: '', text: this.translate.instant('menu.changePassword') },
      { key: 'logout', icon: '', text: this.translate.instant('menu.logout') },
    ],
  };
  titleData = {
    all: this.translate.instant('tab.all'),
    report: this.translate.instant('tab.report'),
    login: this.translate.instant('tab.login'),
    profiles: this.translate.instant('tab.profiles'),
  };
  userDetails: Taikhoan = new Taikhoan('', '');

  constructor(public translate: TranslateService) {}

  ngOnInit(): void {
    this.initLanguageData();
  }

  initLanguageData() {
    this.languageData.label.class = 'language language-' + (this.translate.currentLang || 'vn');
    const languageObject = this.translate.instant('lang');
    const languageList: any = [];
    Object.keys(languageObject).forEach((key: string) => {
      const icon = 'language language-' + key;
      const text = languageObject[key];
      languageList.push({ key, icon, text });
    });
    this.languageData['list'] = languageList;
  }

  initUserData() {
    this.userDetails = JSON.parse(JSON.parse(JSON.stringify(localStorage.getItem('userInfo'))));
    this.userData.label.text = this.userDetails.Username;
    const userOptionObject = this.translate.instant('menu');
    const userOptionList: any = [];
    Object.keys(userOptionObject).forEach((key: string) => {
      const icon = '';
      const text = userOptionObject[key];

      userOptionList.push({ key, icon, text });
    });

    this.userData['list'] = userOptionList;
  }

  changeLocale($event: any) {
    if ($event === 'en') {
      sessionStorage.setItem('language', 'en');
    } else if ($event === 'vn') {
      sessionStorage.setItem('language', 'vn');
    }
    location.reload();
  }
  console(): void {
    console.log('1');
  }
  // chooseUserOption($event: any) {
  //   if ($event === 'logout') {
  //     this.authService.logout();
  //     location.reload();
  //   }
  // }

  chooseApp($event: any) {
    const currentLanguage = this.translate.currentLang;
    window.open(CLIENT_URL + getApplicationURL($event, currentLanguage), '_blank');
  }
}
