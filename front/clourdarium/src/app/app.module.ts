import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AquariumComponent } from './aquarium/aquarium.component';
import {HttpClientModule} from "@angular/common/http";
import {AquariumService} from "../services/aquarium.service";


@NgModule({
  declarations: [
    AppComponent,
    AquariumComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [
    AquariumService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
