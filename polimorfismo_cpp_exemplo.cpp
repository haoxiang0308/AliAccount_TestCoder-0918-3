#include <iostream>
#include <vector>
#include <memory>

// Classe base abstrata
class Forma {
protected:
    std::string nome;

public:
    // Construtor
    Forma(const std::string& n) : nome(n) {}

    // Método virtual puro - torna a classe abstrata
    virtual double calcularArea() const = 0;
    
    // Método virtual com implementação padrão
    virtual void exibirInfo() const {
        std::cout << "Forma: " << nome << std::endl;
    }
    
    // Destrutor virtual
    virtual ~Forma() = default;
};

// Classe derivada 1
class Retangulo : public Forma {
private:
    double largura, altura;

public:
    Retangulo(const std::string& n, double l, double a) 
        : Forma(n), largura(l), altura(a) {}
    
    // Implementação do método virtual puro
    double calcularArea() const override {
        return largura * altura;
    }
    
    // Sobrescrita do método virtual
    void exibirInfo() const override {
        std::cout << "Retângulo - Largura: " << largura 
                  << ", Altura: " << altura << std::endl;
        std::cout << "Área: " << calcularArea() << std::endl;
    }
};

// Classe derivada 2
class Circulo : public Forma {
private:
    double raio;

public:
    Circulo(const std::string& n, double r) 
        : Forma(n), raio(r) {}
    
    // Implementação do método virtual puro
    double calcularArea() const override {
        return 3.14159 * raio * raio;
    }
    
    // Sobrescrita do método virtual
    void exibirInfo() const override {
        std::cout << "Círculo - Raio: " << raio << std::endl;
        std::cout << "Área: " << calcularArea() << std::endl;
    }
};

// Classe derivada 3
class Triangulo : public Forma {
private:
    double base, altura;

public:
    Triangulo(const std::string& n, double b, double h) 
        : Forma(n), base(b), altura(h) {}
    
    // Implementação do método virtual puro
    double calcularArea() const override {
        return (base * altura) / 2.0;
    }
    
    // Sobrescrita do método virtual
    void exibirInfo() const override {
        std::cout << "Triângulo - Base: " << base 
                  << ", Altura: " << altura << std::endl;
        std::cout << "Área: " << calcularArea() << std::endl;
    }
};

int main() {
    std::cout << "Exemplo Avançado de Herança e Polimorfismo em C++" << std::endl;
    std::cout << "=================================================" << std::endl;

    // Vetor de ponteiros para a classe base
    std::vector<std::unique_ptr<Forma>> formas;
    
    // Adicionando objetos das classes derivadas
    formas.push_back(std::make_unique<Retangulo>("Retângulo A", 5.0, 3.0));
    formas.push_back(std::make_unique<Circulo>("Círculo B", 2.5));
    formas.push_back(std::make_unique<Triangulo>("Triângulo C", 4.0, 6.0));
    
    // Demonstrando polimorfismo - chamando métodos virtualizados
    for (const auto& forma : formas) {
        forma->exibirInfo();
        std::cout << std::endl;
    }
    
    // Demonstrando cálculo de áreas polimórficas
    std::cout << "\nÁreas calculadas:" << std::endl;
    for (const auto& forma : formas) {
        std::cout << "Área: " << forma->calcularArea() << std::endl;
    }

    return 0;
}