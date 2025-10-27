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
            echo "The {$this->brand} {$this->model} is now running.\n";
        } else {
            echo "The car is already running.\n";
        }
    }
    
    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The {$this->brand} {$this->model} has stopped.\n";
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
    
    public function isRunning() {
        return $this->isRunning;
    }
}

// 示例用法
$car = new Car('Toyota', 'Camry');
$car->start();
echo "Is running: " . ($car->isRunning() ? 'Yes' : 'No') . "\n";