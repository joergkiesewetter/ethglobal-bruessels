import { Player } from "./Player";
import { Tile } from "./Tile";

export class Game {
  map: Tile[][];
  players: Player[];

  constructor(map: Tile[][], players: Player[]) {
    this.map = map;
    this.players = players;
  }
}
