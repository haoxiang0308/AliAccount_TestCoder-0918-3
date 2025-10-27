<?php

class Car {
    private $brand;
    private $model;
    private $isRunning = false;
    
    public function __construct($brand = 'Unknown', $model = 'Unknown') {
        $this->brand = $brand;
        $this->model = $model;
    }
    
    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The {$this->brand} {$this->model} engine has started.\n";
            return true;
        } else {
            echo "The {$this->brand} {$this->model} engine is already running.\n";
            return false;
        }
    }
    
    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The {$this->brand} {$this->model} engine has stopped.\n";
            return true;
        } else {
            echo "The {$this->brand} {$this->model} engine is already stopped.\n";
            return false;
        }
    }
    
    public function getBrand() {
        return $this->brand;
    }
    
    public function getModel() {
        return $this->model;
    }
    
    public function isRunning() {
        return $this->isRunning;
    }
}

// Example usage:
$myCar = new Car('Toyota', 'Camry');
$myCar->start();