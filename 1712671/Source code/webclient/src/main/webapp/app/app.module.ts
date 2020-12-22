import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { CoreModule } from 'app/core/core.module';
import { AppRoutingModule } from './app-routing.module';
// jhipster-needle-angular-add-module-import JHipster will add new module here
import { AppComponent } from './app.component';
import { SharedModule } from './shared/shared.module';
import { HomeModule } from './modules/home/home.module';
import { TranslateModule } from '@ngx-translate/core';
import { HttpClientModule } from '@angular/common/http';
import { ReportModule } from './modules/report/report.module';
@NgModule({
  imports: [
    BrowserModule,
    CoreModule,
    SharedModule,
    AppRoutingModule,
    HomeModule,
    ReportModule,
    HttpClientModule,
    TranslateModule.forRoot({
      defaultLanguage: 'vn',
    }),
  ],
  declarations: [AppComponent],
  bootstrap: [AppComponent],
  providers: [],
})
export class HomejetAngularAppModule {}
