import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
// Import new language here
import en from '../i18n/en/en.json';
import vn from '../i18n/vn/vn.json';

@Component({
  selector: 'jhi-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  visible = false;
  constructor(private translate: TranslateService) {
    // Set language
    translate.setTranslation('en', en);
    translate.setTranslation('vn', vn);
  }

  ngOnInit(): void {
    if (!sessionStorage.getItem('userInfo')) {
      sessionStorage.setItem('language', 'vn');
    }
    this.translate.use(JSON.parse(JSON.stringify(sessionStorage.getItem('language'))));
    this.visible = true;
  }
}
