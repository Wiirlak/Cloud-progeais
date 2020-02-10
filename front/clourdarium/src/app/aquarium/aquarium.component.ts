import { Component, OnInit } from '@angular/core';
import {AquariumService} from "../../services/aquarium.service";
import {HttpClient} from "@angular/common/http";
import {MatTableModule} from "@angular/material/table";

@Component({
  selector: 'app-aquarium',
  templateUrl: './aquarium.component.html',
  styleUrls: ['./aquarium.component.scss']
})
export class AquariumComponent implements OnInit {

  aquariums;

  constructor(private as: AquariumService, private http: HttpClient) {
    this.as = new AquariumService(http);
  }

  ngOnInit() {
    this.aquariums = this.as.getAquariums();
  }

}
