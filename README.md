# ECE271-DesignProject

Added an lpf project file in the Diamond_Files folder, it should auto link you to the live files if your default GitHub folder is in the following path: 

	\'This PC'\Documents\GitHub\ECE271... (for win)
	/home/<user>/Documents/GitHub/ECE271... (for linux)

If this is too complicated just make a new project.

IMPORTANT NOTE: We are adding an extra "reset" key input to the FPGA for flushing inputs

Group members: I am placing all useful reference files and examples in a "Notes and Examples" folder. Feel free to add to this or use it for your work.

[Update by Chris]
    I put in a parser that should work for all of the key board types, the major decoding will be done prior with this in mind. Before we submit, I might have to redraw this to include seperate registers and key_decoders (refer to TopLevelSchematic.pdf) for each keyboard input. I am still determining whether or not we will need a seperate FSM for this.
