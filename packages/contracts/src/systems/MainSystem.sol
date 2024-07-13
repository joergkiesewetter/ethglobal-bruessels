// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { System } from "@latticexyz/world/src/System.sol";
import { Match, MatchCounter, MatchHasPlayer } from "../codegen/index.sol";

contract MainSystem is System {
  function createMatch(
    uint8 sizeX,
    uint8 sizeY,
    uint8 maxPlayers,
    uint32 cityDensity,
    uint32 mountainDensity,
    uint32 armyGrowth
  ) public {
    uint256 matchCount = MatchCounter.get();
    uint256 newMatchId = matchCount + 1;
    MatchCounter.set(newMatchId);

    address matchMasterId = address(_msgSender());

    Match.set(newMatchId, matchMasterId, sizeX, sizeY, maxPlayers, cityDensity, mountainDensity, armyGrowth);
  }

  function changeMatchConfig(
    uint256 matchId,
    uint8 sizeX,
    uint8 sizeY,
    uint8 maxPlayers,
    uint32 cityDensity,
    uint32 mountainDensity,
    uint32 armyGrowth
  ) public {
    require(Match.getMatchMasterId(matchId) == _msgSender(), "Only the match master can change the match config");

    address matchMasterId = address(_msgSender());

    Match.set(matchId, matchMasterId, sizeX, sizeY, maxPlayers, cityDensity, mountainDensity, armyGrowth);
  }

  function joinMatch(uint256 matchId) public {
    address player = address(_msgSender());

    MatchHasPlayer.set(matchId, player, false);
  }

  function removePlayer(uint256 matchId, address playerId) public {
    require(Match.getMatchMasterId(matchId) == _msgSender(), "Only the match master can change the match config");

    MatchHasPlayer.deleteRecord(matchId, playerId);
  }

  function startMatch() public {
    // TODO: Implement
  }
}
