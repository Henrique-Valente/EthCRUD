// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract BatteryStorage{

    /* --- Globals --- */

    uint256 MaterialCount = 0;
    uint256 BatteryCount = 0;

    function getMaterialCount() public view returns (uint256) {
        return MaterialCount;
    }

    function getBatteryCount() public view returns (uint256) {
        return BatteryCount;
    }

    /* --- End Globals --- */

    //Data object to represent the materials
    struct Material { 
        uint256 unique_id;
        string description;
        string manufacturer;
        string[] certifications;
    }

    //Data object to represent the batteries
    struct Battery {
        uint256 unique_id;
        string description;
        string state;
        string[] materials; 
    }

    /* --- Event Declaration --- */

    event LogMaterial(Material newMaterial);
    event LogBattery(Battery newBattery);

    /* --- End Event Declaration --- */

    //Map to store the materials
    mapping(uint256 => Material) public materials;

    //Map to store the batteries
    mapping(uint256 => Battery) public batteries;

    // Get all materials
    function getMaterials() public view returns (Material[] memory){
        Material[] memory ret = new Material[](MaterialCount);

        for (uint256 i = 0; i < MaterialCount; i++) {
            ret[i] = materials[i];
        }

        return ret;
    }
 
    // Material getter by id
    function getMaterial(uint256 unique_id) public view returns (Material memory){ 
        Material memory material = materials[unique_id];
        return material;
    }

    // Material setter
    function setMaterial(uint256 unique_id, string memory description, string memory manufacturer, string[] memory certifications) public {
        Material memory material = Material(unique_id, description, manufacturer, certifications);
        materials[unique_id] = material;
        MaterialCount++;
        emit LogMaterial(material);
    }

    // Get all batteries
    function getBatteries() public view returns (Battery[] memory){
        Battery[] memory ret = new Battery[](BatteryCount);

        for (uint256 i = 0; i < BatteryCount; i++) {
            ret[i] = batteries[i];
        }

        return ret;
    }

    // Battery getter by id
    function getBattery(uint256 unique_id) public view returns (Battery memory){
        Battery memory battery = batteries[unique_id];
        return battery;
    }

    // Battery setter
    function setBattery(uint256 unique_id, string memory description, string memory state, string[] memory input_materials) public {
        Battery memory battery = Battery(unique_id, description, state, input_materials);
        batteries[unique_id] = battery;
        BatteryCount++;
        emit LogBattery(battery);
    }
}