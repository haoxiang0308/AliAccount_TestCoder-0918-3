import toml
import datetime
import random
import string

# Gerar um nome de arquivo aleatório
def generate_random_filename():
    letters = string.ascii_lowercase + string.digits
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}.toml"

# Criar um dicionário com dados de configuração contendo um datetime
config_data = {
    'configuration': {
        'timestamp': datetime.datetime.now().isoformat()
    }
}

# Gerar nome de arquivo aleatório
filename = generate_random_filename()

# Escrever os dados no arquivo TOML
with open(filename, 'w') as f:
    toml.dump(config_data, f)

print(f"Arquivo TOML criado com sucesso: {filename}")
print(f"Conteúdo do arquivo:\n{toml.dumps(config_data)}")