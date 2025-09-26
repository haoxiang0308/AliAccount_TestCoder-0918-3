<?php

class Car {
    private $brand;
    private $model;

    public function __construct($brand, $model) {
        $this->brand = $brand;
        $this->model = $model;
    }

    public function start() {
        echo "The {$this->brand} {$this->model} is starting...\n";
    }
}

?>