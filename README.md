# Faded-enterexit
Enter/Exit script for ox_target

Overview
The Enter/Exit Location Script is a custom solution crafted for FiveM servers, enabling players to effortlessly enter and exit designated locations within the game. Designed to be used with ox_target, this script significantly enhances the gameplay experience by providing intuitive and immersive interactions with various in-game spots.

Installation

Download the Script: Clone this repository or download the ZIP file.

Add to Resources: Place the faded-enterexit folder into your server's resources directory.

Configure the Script:

Open the client.lua file located in the faded-enterexit folder.

Define the locations you want players to interact with by specifying coordinates and other relevant details.

Start the Script:

Add start faded-enterexit to your server.cfg file.

Restart Your Server: Restart your FiveM server to apply the changes.

Example Configuration
Here’s a sample configuration for defining an entry and exit location


    {
    entry = vector3(0.0, 0.0, 0.0), 
    exit = vector3(0.0, 0.0, 0.0),
    headingEnter = 0.0,
    headingExit = 0.0,
    name = "Hidden Location" 
    }



Usage
Players can interact with the defined locations using their third eye (ox_target). Upon interaction, they will smoothly enter or exit the specified location, enhancing immersion and gameplay flow.

Compatibility
This script is designed for use with the QBCore framework and ox_target. Ensure your server is running the appropriate versions of both for full compatibility. It should also work with ESX/QBX, provided you have ox_target.

Note: If you're using a different framework than QBCore, simply remove the TriggerEvent('QBCore:Notify', "You exited " .. location.name, 'success') events from client.lua and the 'qb-core' entry from fxmanifest.lua.

Support
If you encounter any issues or have questions regarding the script, feel free to open an issue in the GitHub repository or reach out to the developer.

License
This project is licensed under the MIT License. See the LICENSE file for more details.
