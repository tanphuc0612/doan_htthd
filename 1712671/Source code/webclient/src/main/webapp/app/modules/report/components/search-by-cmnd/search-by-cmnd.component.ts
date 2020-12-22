import { Component, OnInit } from '@angular/core';
import { NguoiDangKiXeService } from 'app/core/services/nguoiDangKiXe.service';
import { NguoiDangKiXe } from 'app/models/nguoiDangKiXe.model';

@Component({
  selector: 'jhi-search-by-cmnd',
  templateUrl: './search-by-cmnd.component.html',
  styleUrls: ['./search-by-cmnd.component.scss'],
})
export class SearchByCmndComponent implements OnInit {
  cmnd = '';
  visible = false;
  error = false;
  list: NguoiDangKiXe = new NguoiDangKiXe();
  constructor(private service: NguoiDangKiXeService) {}
  submit(): void {
    if (this.cmnd) {
      this.error = false;
      this.service.getByIdentityCard(this.cmnd).subscribe(data => {
        console.log(data);
        if (!data) {
          this.visible = true;
        } else {
          this.list = data;
          this.visible = false;
        }
      });
    } else {
      this.error = true;
    }
  }
  ngOnInit(): void {}
}
