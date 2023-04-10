// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract BatteryStorage{
    
    //Data object to represent the materials
    struct Material { 
        string unique_id;
        string description;
        string manufacturer;
        string[] certifications;
    }

    //Data object to represent the batteries
    struct Battery {
        string unique_id;
        string description;
        string state;
        Material[] materials; 
    }

    //Map to store the materials
    mapping(string => Material) public materials;

    //Map to store the batteries
    mapping(string => Battery) public batteries;
 
    // Material getter
    function getMaterial(string memory unique_id) public view returns (Material memory){ 
        Material memory material = materials[unique_id];
        return material;
    }

    // Material setter
    function setMaterial(string memory unique_id, string memory description, string memory manufacturer, string[] memory certifications) public {
        Material memory material = Material(unique_id, description, manufacturer, certifications);
        materials[unique_id] = material;
    }

    // Battery getter
    function getBattery(string memory unique_id) public view returns (Battery memory){
        Battery memory battery = batteries[unique_id];
        return battery;
    }

    // Battery setter
    function setBattery(string memory unique_id, string memory description, string memory state, Material[] memory input_materials) public {
        Battery memory battery = Battery(unique_id, description, state, input_materials);
        batteries[unique_id] = battery;
    }

}