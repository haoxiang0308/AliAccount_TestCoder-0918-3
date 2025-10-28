<?php

class Car {
    private $brand;
    private $model;
    private $isRunning = false;
    
    public function __construct($brand = "Unknown", $model = "Unknown") {
        $this->brand = $brand;
        $this->model = $model;
    }
    
    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The {$this->brand} {$this->model} engine is now running.\n";
        } else {
            echo "The {$this->brand} {$this->model} is already running.\n";
        }
    }
    
    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The {$this->brand} {$this->model} engine has been stopped.\n";
        } else {
            echo "The {$this->brand} {$this->model} is already stopped.\n";
        }
    }
    
    public function getStatus() {
        return $this->isRunning ? "running" : "stopped";
    }
    
    public function getBrand() {
        return $this->brand;
    }
    
    public function getModel() {
        return $this->model;
    }
}

// 示例使用
$car = new Car("Toyota", "Camry");
echo "Car: " . $car->getBrand() . " " . $car->getModel() . "\n";
echo "Status: " . $car->getStatus() . "\n";
$car->start();
echo "Status: " . $car->getStatus() . "\n";
$car->start(); // 尝试再次启动
$car->stop();
echo "Status: " . $car->getStatus() . "\n";