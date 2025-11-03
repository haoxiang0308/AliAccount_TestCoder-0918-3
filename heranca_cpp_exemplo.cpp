#include <iostream>
#include <string>

// Classe base
class Veiculo {
protected:
    std::string marca;
    int ano;

public:
    // Construtor da classe base
    Veiculo(std::string m, int a) : marca(m), ano(a) {}

    // Método virtual para demonstrar polimorfismo
    virtual void exibirDetalhes() {
        std::cout << "Veículo - Marca: " << marca << ", Ano: " << ano << std::endl;
    }

    // Método para obter a marca
    std::string getMarca() const {
        return marca;
    }

    // Método para obter o ano
    int getAno() const {
        return ano;
    }

    // Destrutor virtual
    virtual ~Veiculo() {
        std::cout << "Destrutor de Veiculo chamado para " << marca << std::endl;
    }
};

// Classe derivada
class Carro : public Veiculo {
private:
    int numeroPortas;

public:
    // Construtor da classe derivada
    Carro(std::string m, int a, int np) : Veiculo(m, a), numeroPortas(np) {}

    // Sobrescrita do método da classe base
    void exibirDetalhes() override {
        std::cout << "Carro - Marca: " << marca << ", Ano: " << ano 
                  << ", Número de portas: " << numeroPortas << std::endl;
    }

    // Método específico da classe derivada
    int getNumeroPortas() const {
        return numeroPortas;
    }

    // Destrutor
    ~Carro() {
        std::cout << "Destrutor de Carro chamado para " << marca << std::endl;
    }
};

// Classe derivada adicional para demonstrar herança
class Moto : public Veiculo {
private:
    bool temCarona;

public:
    // Construtor da classe derivada
    Moto(std::string m, int a, bool tc) : Veiculo(m, a), temCarona(tc) {}

    // Sobrescrita do método da classe base
    void exibirDetalhes() override {
        std::cout << "Moto - Marca: " << marca << ", Ano: " << ano 
                  << ", Tem carona: " << (temCarona ? "Sim" : "Não") << std::endl;
    }

    // Método específico da classe derivada
    bool getTemCarona() const {
        return temCarona;
    }

    // Destrutor
    ~Moto() {
        std::cout << "Destrutor de Moto chamado para " << marca << std::endl;
    }
};

// Função para demonstrar o uso das classes
int main() {
    std::cout << "Exemplo de Herança em C++" << std::endl;
    std::cout << "=========================" << std::endl;

    // Criando objetos das classes
    Veiculo* v1 = new Carro("Fiat", 2022, 4);
    Veiculo* v2 = new Moto("Honda", 2023, true);
    Veiculo v3("Ford", 2021);

    // Chamando os métodos
    v1->exibirDetalhes();
    v2->exibirDetalhes();
    v3.exibirDetalhes();

    // Demonstrando acesso a métodos específicos
    Carro* c = dynamic_cast<Carro*>(v1);
    if (c != nullptr) {
        std::cout << "Número de portas do carro: " << c->getNumeroPortas() << std::endl;
    }

    Moto* m = dynamic_cast<Moto*>(v2);
    if (m != nullptr) {
        std::cout << "Moto tem carona: " << (m->getTemCarona() ? "Sim" : "Não") << std::endl;
    }

    // Limpeza de memória
    delete v1;
    delete v2;

    return 0;
}