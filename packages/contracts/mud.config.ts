import { defineWorld } from "@latticexyz/world";

export default defineWorld({
  tables: {
    MatchCounter: {
      schema: {
        value: "uint256",
      },
      key: [],
    },
    Match: {
      schema: {
        id: "uint256",
        matchMasterId: "address",
        sizeX: "uint8",
        sizeY: "uint8",
        maxPlayers: "uint8",
        cityDensity: "uint32",
        mountainDensity: "uint32",
        armyGrowth: "uint32",
      },
      key: ["id"],
    },
    Player: {
      schema: {
        id: "address",
        name: "string",
      },
      key: ["id"],
    },
    MatchHasPlayer: {
      schema: {
        matchId: "uint256",
        playerId: "address",
        ready: "bool",
      },
      key: ["matchId", "playerId"],
    },
    PlayerReady: {
      schema: {
        matchId: "uint32",
        playerId: "address",
        ready: "bool",
      },
      key: ["matchId", "playerId"],
    },
    Tile: {
      schema: {
        matchId: "uint32",
        x: "uint32",
        y: "uint32",
        tileType: "uint8",
        unitId: "uint32",
        playerId: "address",
      },
      key: ["matchId", "x", "y"],
    },
  },
});
