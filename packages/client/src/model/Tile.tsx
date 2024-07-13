import { Player } from "./Player";
import { TileType } from "./TileType";

export class Tile {
  type: TileType;
  owner?: Player;
  units: number = 0;

  constructor(type: TileType, owner?: Player) {
    this.type = type;
    this.owner = owner;
  }
}
