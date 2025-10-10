<?php

class Car {
    private string $brand;
    private string $model;

    public function __construct(string $brand, string $model) {
        $this->brand = $brand;
        $this->model = $model;
    }

    public function start(): void {
        echo "The {$this->brand} {$this->model} is starting...\n";
    }
}

// Example usage:
// $myCar = new Car("Toyota", "Camry");
// $myCar->start();