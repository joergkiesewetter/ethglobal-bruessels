// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema } from "@latticexyz/store/src/Schema.sol";
import { EncodedLengths, EncodedLengthsLib } from "@latticexyz/store/src/EncodedLengths.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

struct MatchData {
  address matchMasterId;
  uint8 sizeX;
  uint8 sizeY;
  uint8 maxPlayers;
  uint32 cityDensity;
  uint32 mountainDensity;
  uint32 armyGrowth;
}

library Match {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "", name: "Match", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x746200000000000000000000000000004d617463680000000000000000000000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0023070014010101040404000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (uint256)
  Schema constant _keySchema = Schema.wrap(0x002001001f000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (address, uint8, uint8, uint8, uint32, uint32, uint32)
  Schema constant _valueSchema = Schema.wrap(0x0023070061000000030303000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "id";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](7);
    fieldNames[0] = "matchMasterId";
    fieldNames[1] = "sizeX";
    fieldNames[2] = "sizeY";
    fieldNames[3] = "maxPlayers";
    fieldNames[4] = "cityDensity";
    fieldNames[5] = "mountainDensity";
    fieldNames[6] = "armyGrowth";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get matchMasterId.
   */
  function getMatchMasterId(uint256 id) internal view returns (address matchMasterId) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Get matchMasterId.
   */
  function _getMatchMasterId(uint256 id) internal view returns (address matchMasterId) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Set matchMasterId.
   */
  function setMatchMasterId(uint256 id, address matchMasterId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((matchMasterId)), _fieldLayout);
  }

  /**
   * @notice Set matchMasterId.
   */
  function _setMatchMasterId(uint256 id, address matchMasterId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((matchMasterId)), _fieldLayout);
  }

  /**
   * @notice Get sizeX.
   */
  function getSizeX(uint256 id) internal view returns (uint8 sizeX) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get sizeX.
   */
  function _getSizeX(uint256 id) internal view returns (uint8 sizeX) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set sizeX.
   */
  function setSizeX(uint256 id, uint8 sizeX) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((sizeX)), _fieldLayout);
  }

  /**
   * @notice Set sizeX.
   */
  function _setSizeX(uint256 id, uint8 sizeX) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((sizeX)), _fieldLayout);
  }

  /**
   * @notice Get sizeY.
   */
  function getSizeY(uint256 id) internal view returns (uint8 sizeY) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get sizeY.
   */
  function _getSizeY(uint256 id) internal view returns (uint8 sizeY) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set sizeY.
   */
  function setSizeY(uint256 id, uint8 sizeY) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((sizeY)), _fieldLayout);
  }

  /**
   * @notice Set sizeY.
   */
  function _setSizeY(uint256 id, uint8 sizeY) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((sizeY)), _fieldLayout);
  }

  /**
   * @notice Get maxPlayers.
   */
  function getMaxPlayers(uint256 id) internal view returns (uint8 maxPlayers) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get maxPlayers.
   */
  function _getMaxPlayers(uint256 id) internal view returns (uint8 maxPlayers) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set maxPlayers.
   */
  function setMaxPlayers(uint256 id, uint8 maxPlayers) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((maxPlayers)), _fieldLayout);
  }

  /**
   * @notice Set maxPlayers.
   */
  function _setMaxPlayers(uint256 id, uint8 maxPlayers) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreCore.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((maxPlayers)), _fieldLayout);
  }

  /**
   * @notice Get cityDensity.
   */
  function getCityDensity(uint256 id) internal view returns (uint32 cityDensity) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get cityDensity.
   */
  function _getCityDensity(uint256 id) internal view returns (uint32 cityDensity) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set cityDensity.
   */
  function setCityDensity(uint256 id, uint32 cityDensity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((cityDensity)), _fieldLayout);
  }

  /**
   * @notice Set cityDensity.
   */
  function _setCityDensity(uint256 id, uint32 cityDensity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreCore.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((cityDensity)), _fieldLayout);
  }

  /**
   * @notice Get mountainDensity.
   */
  function getMountainDensity(uint256 id) internal view returns (uint32 mountainDensity) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 5, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get mountainDensity.
   */
  function _getMountainDensity(uint256 id) internal view returns (uint32 mountainDensity) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 5, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set mountainDensity.
   */
  function setMountainDensity(uint256 id, uint32 mountainDensity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 5, abi.encodePacked((mountainDensity)), _fieldLayout);
  }

  /**
   * @notice Set mountainDensity.
   */
  function _setMountainDensity(uint256 id, uint32 mountainDensity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreCore.setStaticField(_tableId, _keyTuple, 5, abi.encodePacked((mountainDensity)), _fieldLayout);
  }

  /**
   * @notice Get armyGrowth.
   */
  function getArmyGrowth(uint256 id) internal view returns (uint32 armyGrowth) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 6, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get armyGrowth.
   */
  function _getArmyGrowth(uint256 id) internal view returns (uint32 armyGrowth) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 6, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set armyGrowth.
   */
  function setArmyGrowth(uint256 id, uint32 armyGrowth) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 6, abi.encodePacked((armyGrowth)), _fieldLayout);
  }

  /**
   * @notice Set armyGrowth.
   */
  function _setArmyGrowth(uint256 id, uint32 armyGrowth) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreCore.setStaticField(_tableId, _keyTuple, 6, abi.encodePacked((armyGrowth)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(uint256 id) internal view returns (MatchData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(uint256 id) internal view returns (MatchData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(
    uint256 id,
    address matchMasterId,
    uint8 sizeX,
    uint8 sizeY,
    uint8 maxPlayers,
    uint32 cityDensity,
    uint32 mountainDensity,
    uint32 armyGrowth
  ) internal {
    bytes memory _staticData = encodeStatic(
      matchMasterId,
      sizeX,
      sizeY,
      maxPlayers,
      cityDensity,
      mountainDensity,
      armyGrowth
    );

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    uint256 id,
    address matchMasterId,
    uint8 sizeX,
    uint8 sizeY,
    uint8 maxPlayers,
    uint32 cityDensity,
    uint32 mountainDensity,
    uint32 armyGrowth
  ) internal {
    bytes memory _staticData = encodeStatic(
      matchMasterId,
      sizeX,
      sizeY,
      maxPlayers,
      cityDensity,
      mountainDensity,
      armyGrowth
    );

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint256 id, MatchData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.matchMasterId,
      _table.sizeX,
      _table.sizeY,
      _table.maxPlayers,
      _table.cityDensity,
      _table.mountainDensity,
      _table.armyGrowth
    );

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint256 id, MatchData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.matchMasterId,
      _table.sizeX,
      _table.sizeY,
      _table.maxPlayers,
      _table.cityDensity,
      _table.mountainDensity,
      _table.armyGrowth
    );

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  )
    internal
    pure
    returns (
      address matchMasterId,
      uint8 sizeX,
      uint8 sizeY,
      uint8 maxPlayers,
      uint32 cityDensity,
      uint32 mountainDensity,
      uint32 armyGrowth
    )
  {
    matchMasterId = (address(Bytes.getBytes20(_blob, 0)));

    sizeX = (uint8(Bytes.getBytes1(_blob, 20)));

    sizeY = (uint8(Bytes.getBytes1(_blob, 21)));

    maxPlayers = (uint8(Bytes.getBytes1(_blob, 22)));

    cityDensity = (uint32(Bytes.getBytes4(_blob, 23)));

    mountainDensity = (uint32(Bytes.getBytes4(_blob, 27)));

    armyGrowth = (uint32(Bytes.getBytes4(_blob, 31)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    EncodedLengths,
    bytes memory
  ) internal pure returns (MatchData memory _table) {
    (
      _table.matchMasterId,
      _table.sizeX,
      _table.sizeY,
      _table.maxPlayers,
      _table.cityDensity,
      _table.mountainDensity,
      _table.armyGrowth
    ) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint256 id) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint256 id) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    address matchMasterId,
    uint8 sizeX,
    uint8 sizeY,
    uint8 maxPlayers,
    uint32 cityDensity,
    uint32 mountainDensity,
    uint32 armyGrowth
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(matchMasterId, sizeX, sizeY, maxPlayers, cityDensity, mountainDensity, armyGrowth);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    address matchMasterId,
    uint8 sizeX,
    uint8 sizeY,
    uint8 maxPlayers,
    uint32 cityDensity,
    uint32 mountainDensity,
    uint32 armyGrowth
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData = encodeStatic(
      matchMasterId,
      sizeX,
      sizeY,
      maxPlayers,
      cityDensity,
      mountainDensity,
      armyGrowth
    );

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint256 id) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(id));

    return _keyTuple;
  }
}
