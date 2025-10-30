open System
open System.IO

// Função para gerar um nome de arquivo aleatório
let generateRandomFileName extension =
    let random = Random()
    let randomPart = String.init 8 (fun _ -> 
        let num = random.Next(0, 36)
        if num < 10 then char (num + int '0') else char (num - 10 + int 'a'))
    sprintf "processed_data_%s%s" randomPart extension

// Função para processar dados usando pipeline
let processData data =
    data
    |> List.map (fun x -> x * 2)                    // Dobra cada elemento
    |> List.filter (fun x -> x > 10)               // Filtra valores maiores que 10
    |> List.sortDescending                         // Ordena em ordem decrescente
    |> List.take 5                                 // Pega os 5 primeiros
    |> List.mapi (fun i x -> sprintf "Item %d: %d" (i + 1) x)  // Adiciona índice

// Função para salvar dados em arquivo com nome aleatório
let saveDataToFile data =
    let fileName = generateRandomFileName ".txt"
    let filePath = Path.Combine(Environment.CurrentDirectory, fileName)
    File.WriteAllLines(filePath, data)
    printfn "Dados salvos no arquivo: %s" filePath
    filePath

// Exemplo de uso
let sampleData = [1; 3; 5; 7; 9; 11; 13; 15; 17; 19; 20; 25]

let processedData = 
    sampleData
    |> processData

let filePath = 
    processedData
    |> saveDataToFile

printfn "Processamento concluído. Arquivo gerado: %s" filePath