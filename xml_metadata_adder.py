import xml.etree.ElementTree as ET
import random
import string
import os

def add_metadata_attributes(xml_content, metadata_dict):
    """
    Adiciona atributos de metadados a elementos XML
    
    Args:
        xml_content: String contendo o XML
        metadata_dict: Dicionário com metadados a serem adicionados
    
    Returns:
        ElementTree do XML modificado
    """
    # Parse do XML
    root = ET.fromstring(xml_content)
    
    # Adiciona os metadados como atributos ao elemento raiz
    for key, value in metadata_dict.items():
        root.set(key, str(value))
    
    # Se houver elementos filhos, também podemos adicionar metadados a eles
    for child in root.iter():
        if child != root:  # Evita adicionar novamente ao root
            for key, value in metadata_dict.items():
                if f"{key}_child" not in child.attrib:  # Evita duplicatas
                    child.set(f"{key}_child", str(value))
    
    return root

def generate_random_filename(extension="xml"):
    """
    Gera um nome de arquivo aleatório
    
    Args:
        extension: Extensão do arquivo (padrão: xml)
    
    Returns:
        String com nome de arquivo aleatório
    """
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for i in range(12))
    return f"{random_name}.{extension}"

def save_xml_with_random_name(root_element, extension="xml"):
    """
    Salva o elemento XML em um arquivo com nome aleatório
    
    Args:
        root_element: Elemento XML a ser salvo
        extension: Extensão do arquivo (padrão: xml)
    
    Returns:
        Caminho do arquivo salvo
    """
    random_filename = generate_random_filename(extension)
    full_path = os.path.join("/workspace", random_filename)
    
    # Converte o elemento para string e salva no arquivo
    tree = ET.ElementTree(root_element)
    tree.write(full_path, encoding='utf-8', xml_declaration=True)
    
    return full_path

# Exemplo de uso
if __name__ == "__main__":
    # XML de exemplo
    sample_xml = """<?xml version="1.0" encoding="UTF-8"?>
<document>
    <section id="intro">
        <title>Introdução</title>
        <content>Este é um exemplo de documento XML.</content>
    </section>
    <section id="body">
        <title>Corpo do Documento</title>
        <content>Aqui está o conteúdo principal.</content>
        <subsection>
            <title>Subseção</title>
            <content>Conteúdo da subseção.</content>
        </subsection>
    </section>
</document>"""
    
    # Dicionário com metadados
    metadata = {
        "created_date": "2023-10-30",
        "author": "Sistema Automático",
        "version": "1.0",
        "category": "Exemplo",
        "status": "draft"
    }
    
    # Adiciona os metadados ao XML
    modified_root = add_metadata_attributes(sample_xml, metadata)
    
    # Salva em um arquivo com nome aleatório
    saved_file_path = save_xml_with_random_name(modified_root)
    
    print(f"XML com metadados adicionados salvo em: {saved_file_path}")
    
    # Mostra o conteúdo do XML modificado
    print("\nConteúdo do XML modificado:")
    ET.dump(modified_root)