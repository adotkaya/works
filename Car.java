package lab05;

import java.util.Random;

public class Car extends Vehicle {


	protected String homeland;


	public Car(String model,int minkms, int maxkms){
		super();
		this.maxkms = maxkms;
		this.minkms = minkms;
		this.model = model;
	}



	public int getRandomSpeed() {
		Random randomSpeed = new Random();
		return randomSpeed.nextInt(maxkms-minkms) + minkms;
	}


	public void sound() {
		System.out.print("Car sound: ");
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		Car clone =  new Car(this.model, this.minkms, this.maxkms);

		return clone;
	}

	@Override
	public boolean equals(Object obj) {
		return obj instanceof Car;
	}

	@Override
	public String toString() {
		return "Car{" +
				"model='" + model + '\'' +
				", minkms=" + minkms +
				", maxkms=" + maxkms +
				'}';
	}
}
