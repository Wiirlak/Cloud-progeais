export class Aquarium {
  id: number;
  name: string;
  occupation: number;
  capacity: number;
  currTemp: number;
  perfectTemp: number;

  constructor(Id: number, Name: string, Occupation: number, Capacity: number, CurrTemp: number, PerfectTemp: number) {
    this.id = Id;
    this.name = Name;
    this.occupation = Occupation;
    this.capacity = Capacity;
    this.currTemp = CurrTemp;
    this.perfectTemp = PerfectTemp;
  }
}
