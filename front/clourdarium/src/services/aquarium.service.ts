import {Injectable} from "@angular/core";
import {HttpClientModule, HttpClient} from "@angular/common/http";
//import { Subject } from 'rxjs/Subject';
import {Aquarium} from "../shared/models/aquarium.model";

@Injectable()
export class AquariumService{
  constructor(private http: HttpClient) {}

  public result: Array<Aquarium> = new Array<Aquarium>();

  getAquariums(): Array<Aquarium> {
    let response = this.http.get<any[]>('https://localhost:5001/api/aquarium')
      .subscribe(
        (res) => {
          res.forEach(aqua => {
            console.log(aqua);
            this.result.push(new Aquarium(
              aqua["id"],
              aqua["name"],
              aqua["occupation"],
              aqua["capacity"],
              aqua["currTemp"],
              aqua["perfectTemp"]
            ));
          });
        },
        (error) => alert(error)
      );
    return this.result;
  }
}
