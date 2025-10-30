#include <iostream>
#include <string>

// Base class
class Animal {
protected:
    std::string name;
    int age;

public:
    // Constructor
    Animal(const std::string& n, int a) : name(n), age(a) {
        std::cout << "Animal constructor called for " << name << std::endl;
    }

    // Virtual destructor
    virtual ~Animal() {
        std::cout << "Animal destructor called for " << name << std::endl;
    }

    // Virtual function
    virtual void makeSound() const {
        std::cout << name << " makes a sound" << std::endl;
    }

    // Regular function
    void displayInfo() const {
        std::cout << "Name: " << name << ", Age: " << age << std::endl;
    }

    // Getter methods
    std::string getName() const { return name; }
    int getAge() const { return age; }
};

// Derived class
class Dog : public Animal {
private:
    std::string breed;

public:
    // Constructor calling base class constructor
    Dog(const std::string& n, int a, const std::string& b) 
        : Animal(n, a), breed(b) {
        std::cout << "Dog constructor called for " << name << std::endl;
    }

    // Destructor
    ~Dog() {
        std::cout << "Dog destructor called for " << name << std::endl;
    }

    // Override the virtual function
    void makeSound() const override {
        std::cout << name << " barks: Woof! Woof!" << std::endl;
    }

    // Additional method specific to Dog
    void wagTail() const {
        std::cout << name << " wags tail happily!" << std::endl;
    }

    // Method to display dog-specific info
    void displayDogInfo() const {
        displayInfo(); // Call base class method
        std::cout << "Breed: " << breed << std::endl;
    }
};

// Another derived class to demonstrate multiple derived classes
class Cat : public Animal {
private:
    bool isIndoor;

public:
    // Constructor calling base class constructor
    Cat(const std::string& n, int a, bool indoor) 
        : Animal(n, a), isIndoor(indoor) {
        std::cout << "Cat constructor called for " << name << std::endl;
    }

    // Destructor
    ~Cat() {
        std::cout << "Cat destructor called for " << name << std::endl;
    }

    // Override the virtual function
    void makeSound() const override {
        std::cout << name << " meows: Meow! Meow!" << std::endl;
    }

    // Additional method specific to Cat
    void purr() const {
        std::cout << name << " purrs softly..." << std::endl;
    }

    // Method to display cat-specific info
    void displayCatInfo() const {
        displayInfo(); // Call base class method
        std::cout << "Indoor cat: " << (isIndoor ? "Yes" : "No") << std::endl;
    }
};

// Example usage
int main() {
    std::cout << "=== Creating base class object ===" << std::endl;
    Animal genericAnimal("Generic Animal", 5);
    genericAnimal.makeSound();
    genericAnimal.displayInfo();

    std::cout << "\n=== Creating derived class objects ===" << std::endl;
    
    Dog myDog("Buddy", 3, "Golden Retriever");
    myDog.makeSound();  // Calls overridden method
    myDog.displayDogInfo();
    myDog.wagTail();

    std::cout << "\n";
    
    Cat myCat("Whiskers", 2, true);
    myCat.makeSound();  // Calls overridden method
    myCat.displayCatInfo();
    myCat.purr();

    std::cout << "\n=== Polymorphism example ===" << std::endl;
    
    // Polymorphism - base class pointer pointing to derived class objects
    Animal* animalPtr;

    animalPtr = &myDog;
    animalPtr->makeSound();  // Calls Dog's makeSound

    animalPtr = &myCat;
    animalPtr->makeSound();  // Calls Cat's makeSound

    std::cout << "\n=== Demonstrating virtual destructors ===" << std::endl;
    
    // Using dynamic allocation to demonstrate virtual destructors
    Animal* dynamicDog = new Dog("Rex", 4, "German Shepherd");
    dynamicDog->makeSound();
    delete dynamicDog;  // This will call the derived destructor first, then base destructor

    return 0;
}