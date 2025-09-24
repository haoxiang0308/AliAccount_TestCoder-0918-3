<?php

class Car {
    private $make;
    private $model;
    private $year;
    private $started = false;

    public function __construct($make, $model, $year) {
        $this->make = $make;
        $this->model = $model;
        $this->year = $year;
    }

    public function start() {
        if (!$this->started) {
            $this->started = true;
            echo "The {$this->year} {$this->make} {$this->model} has started.\n";
        } else {
            echo "The {$this->make} {$this->model} is already running.\n";
        }
    }

    // Optional: A method to stop the car
    public function stop() {
        if ($this->started) {
            $this->started = false;
            echo "The {$this->year} {$this->make} {$this->model} has stopped.\n";
        } else {
            echo "The {$this->make} {$this->model} is already off.\n";
        }
    }

    // Optional: Get a string representation of the car
    public function __toString() {
        return "{$this->year} {$this->make} {$this->model}";
    }
}

// Example usage:
// $myCar = new Car("Toyota", "Camry", 2020);
// echo $myCar;
// $myCar->start();
// $myCar->start();
// $myCar->stop();