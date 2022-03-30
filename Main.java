package lab05;

public class Main {

	/**
	 * Look at all classes to find tasks. When you create other methods to help your
	 * tasks, create a comment block to explain the method. At least one extra
	 * method create.
	 */

	public static void main(String[] args) {
		Race carRace = new CarRace();
		Vehicle ferrari = new SportsCar("Ferrari Testarossa", 100, 290);
		Vehicle pontiac = new MuscleCar("Pontiac GTO", 80, 142);
		carRace.simulateRace(10000, ferrari, pontiac);
	}

}
