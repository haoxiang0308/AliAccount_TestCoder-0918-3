<?php
class Car {
    private string $model;

    public function __construct(string $model) {
        $this->model = $model;
    }

    public function start(): void {
        echo "The {$this->model} is starting...\n";
    }
}