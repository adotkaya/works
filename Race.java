package lab05;

public abstract class Race {

	/**
	 * This method simulates a random race using two vehicles. Cars move forward one
	 * by one. Cars make a sound every time when they move. Cars drive at a random
	 * speed for each round. Print the necessary information on the screen for each
	 * round.
	 * 
	 * @param km length of the racetrack as kilometer unit
	 * @param a  the first vehicle
	 * @param b  the second vehicle
	 * @return the winner object
	 */
	abstract Vehicle simulateRace(int km, Vehicle a, Vehicle b);
}
