import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReportComponent } from './report.component';
import { SharedModule } from 'app/shared/shared.module';
import { SearchByCmndComponent } from './components/search-by-cmnd/search-by-cmnd.component';
import { FormsModule } from '@angular/forms';
@NgModule({
  declarations: [ReportComponent, SearchByCmndComponent],
  imports: [CommonModule, SharedModule, FormsModule],
  exports: [ReportComponent],
})
export class ReportModule {}
