<?php

class Car {
    private $brand;
    private $model;
    private $year;
    private $isRunning;

    public function __construct($brand = 'Unknown', $model = 'Unknown', $year = 0) {
        $this->brand = $brand;
        $this->model = $model;
        $this->year = $year;
        $this->isRunning = false;
    }

    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The {$this->year} {$this->brand} {$this->model} has started.\n";
        } else {
            echo "The car is already running.\n";
        }
    }

    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The {$this->year} {$this->brand} {$this->model} has stopped.\n";
        } else {
            echo "The car is already stopped.\n";
        }
    }

    public function getBrand() {
        return $this->brand;
    }

    public function getModel() {
        return $this->model;
    }

    public function getYear() {
        return $this->year;
    }

    public function isRunning() {
        return $this->isRunning;
    }
}

// Example usage:
$car = new Car("Toyota", "Camry", 2022);
$car->start();
$car->stop();