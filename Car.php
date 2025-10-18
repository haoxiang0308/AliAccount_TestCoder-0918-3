<?php

class Car {
    private $brand;
    private $model;
    private $isRunning = false;

    public function __construct($brand, $model) {
        $this->brand = $brand;
        $this->model = $model;
    }

    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The {$this->brand} {$this->model} is starting...\n";
        } else {
            echo "The {$this->brand} {$this->model} is already running.\n";
        }
    }

    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The {$this->brand} {$this->model} has stopped.\n";
        } else {
            echo "The {$this->brand} {$this->model} is already stopped.\n";
        }
    }

    public function getStatus() {
        return $this->isRunning ? "running" : "stopped";
    }
}