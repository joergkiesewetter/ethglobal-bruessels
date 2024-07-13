import { useComponentValue } from "@latticexyz/react";
import { singletonEntity } from "@latticexyz/store-sync/recs";

import Panzoom from "@panzoom/panzoom";
import { use, useEffect } from "react";

import { useMUD } from "src/MUDContext";
import { Game } from "src/model/Game";
import { Tile } from "src/model/Tile";
import { TileType } from "src/model/TileType";
import { Player } from "src/model/Player";

import "./Match.css";

const player1 = new Player(0, "Player 1", "red");
const player2 = new Player(1, "Player 2", "blue");

const activePlayer = player1;

const state = new Game(
  [
    [
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
    ],
    [
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
    ],
    [
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
    ],
    [
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
    ],
    [
      new Tile(TileType.Grass, player1),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass, player2),
    ],
    [
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
    ],
    [
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
    ],
    [
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
    ],
    [
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
    ],
    [
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
      new Tile(TileType.Grass),
    ],
  ],
  [player1, player2]
);

export default () => {
  const {
    components: { Counter },
    systemCalls: { increment },
  } = useMUD();

  useEffect(() => {
    //
    // apply the map movement handler
    //
    const elem = document.getElementById("gameMap");
    const panzoom = Panzoom(elem!, {
      maxScale: 5,
      // animate: true,
      canvas: true,
      cursor: "default",
      startX: elem!.parentElement!.clientWidth / 2 - elem!.clientWidth! / 2,
      startY: elem!.parentElement!.clientHeight / 2 - elem!.clientHeight! / 2,
    });
    // panzoom.zoom(2, { animate: true });

    elem!.parentElement!.addEventListener("wheel", panzoom.zoomWithWheel);
  });

  useEffect(() => {
    //
    // construct the map
    //
    let map = document.getElementById("gameMap")!;
    map.id = "gameMap";

    while (map.firstChild) {
      map.removeChild(map.lastChild!);
    }

    map.appendChild(document.createElement("tbody"));
    map = map.firstChild! as HTMLElement;
    state.map.forEach((row) => {
      const rowElement = document.createElement("tr");
      row.forEach((tile: Tile) => {
        const tileElement = document.createElement("td");

        tileElement.style.backgroundColor = tile.owner?.color!;

        if (tile.owner) {
          tileElement.textContent = tile.units.toString();
        }

        rowElement.appendChild(tileElement);
      });

      map.appendChild(rowElement);
    });

    //
    // show player list
    //
    document.getElementById("topRightContainer")!.style.display = "initial";
    let playerList = document.querySelector("#playerList")!;

    while (playerList.firstChild) {
      playerList.removeChild(playerList.lastChild!);
    }

    playerList.appendChild(document.createElement("tbody"));
    playerList = playerList.firstChild! as HTMLElement;

    // header
    const headerRow = document.createElement("tr");

    let headerElement = document.createElement("th");
    headerElement.textContent = "Players";
    headerRow.appendChild(headerElement);

    headerElement = document.createElement("th");
    headerElement.textContent = "Fields";
    headerRow.appendChild(headerElement);

    headerElement = document.createElement("th");
    headerElement.textContent = "Units";
    headerRow.appendChild(headerElement);

    playerList.appendChild(headerRow);

    const tileCount: number[] = [];
    const unitCount: number[] = [];

    state.map.forEach((row) => {
      row.forEach((tile) => {
        if (tile.owner) {
          if (!tileCount[tile.owner!.id]) {
            tileCount[tile.owner.id] = 0;
            unitCount[tile.owner.id] = 0;
          }

          tileCount[tile.owner.id]++;
          unitCount[tile.owner.id] += tile.units;
        }
      });
    });

    state.players.forEach((player) => {
      const playerRow = document.createElement("tr");

      const playerNameElement = document.createElement("td");
      playerNameElement.textContent = player.name;
      playerRow.appendChild(playerNameElement);

      const playerTileCountElement = document.createElement("td");
      playerTileCountElement.style.textAlign = "right";
      playerTileCountElement.textContent = tileCount[player.id].toString();
      playerRow.appendChild(playerTileCountElement);

      const playerUnitCountElement = document.createElement("td");
      playerUnitCountElement.style.textAlign = "right";
      playerUnitCountElement.textContent = unitCount[player.id].toString();
      playerRow.appendChild(playerUnitCountElement);

      playerList.appendChild(playerRow);
    });
  }, [state]);

  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div className="relative">
        <div id="gameScroll" className="gameScroll">
          <table id="gameMap">
            <tbody>
              <tr>
                <td></td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div id="topLeftContainer">top left</div>
        <div id="topRightContainer">
          <table id="playerList"></table>
        </div>
        <div id="bottomLeftContainer">bottom left</div>
        <div id="bottomRightContainer">bottomright</div>
      </div>
    </main>
  );
};
