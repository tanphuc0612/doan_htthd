import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from 'app/modules/home/home.component';
import { ReportComponent } from 'app/modules/report/report.component';
const routes: Routes = [
  {
    path: 'home',
    component: HomeComponent,
  },
  {
    path: 'report',
    component: ReportComponent,
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full',
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
