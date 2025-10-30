# Função F# com Pipeline para Processamento de Dados

Este repositório contém um exemplo de função F# que utiliza o operador de pipeline (`|>`) para processar dados e salvá-los em um arquivo com nome aleatório.

## Descrição do Código

O arquivo `data_processor.fsx` contém:

1. Uma função `generateRandomFileName` que cria nomes de arquivos aleatórios
2. Uma função `processData` que usa pipeline para:
   - Dobrar cada elemento da lista
   - Filtrar valores maiores que 10
   - Ordenar em ordem decrescente
   - Pegar os 5 primeiros elementos
   - Adicionar um índice a cada item
3. Uma função `saveDataToFile` que salva os dados em um arquivo com nome aleatório
4. Um exemplo de uso que demonstra o pipeline completo

## Exemplo de Pipeline

```fsharp
let processData data =
    data
    |> List.map (fun x -> x * 2)                    // Dobra cada elemento
    |> List.filter (fun x -> x > 10)               // Filtra valores maiores que 10
    |> List.sortDescending                         // Ordena em ordem decrescente
    |> List.take 5                                 // Pega os 5 primeiros
    |> List.mapi (fun i x -> sprintf "Item %d: %d" (i + 1) x)  // Adiciona índice
```

## Resultado Esperado

Quando executado, o script processa uma lista de números e salva os resultados em um arquivo com nome no formato `processed_data_xxxxxxxx.txt`, onde cada `x` é um caractere aleatório.

O pipeline F# permite encadear operações de forma funcional e legível, onde a saída de uma função se torna a entrada da próxima.