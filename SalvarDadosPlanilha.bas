Sub SalvarDadosEmArquivoAleatorio()
    Dim ws As Worksheet
    Dim dadosArray() As Variant
    Dim ultimoLinha As Long
    Dim ultimaColuna As Long
    Dim nomeArquivo As String
    Dim caminhoArquivo As String
    Dim i As Long, j As Long
    Dim conteudo As String
    
    ' Define a planilha ativa (ou especifique o nome da planilha)
    Set ws = ActiveSheet
    
    ' Encontra a última linha e coluna com dados
    ultimoLinha = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    ultimaColuna = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Redimensiona o array para armazenar todos os dados
    ReDim dadosArray(1 To ultimoLinha, 1 To ultimaColuna)
    
    ' Carrega os dados da planilha para o array
    For i = 1 To ultimoLinha
        For j = 1 To ultimaColuna
            dadosArray(i, j) = ws.Cells(i, j).Value
        Next j
    Next i
    
    ' Gera um nome de arquivo aleatório
    Randomize
    nomeArquivo = "dados_" & Int((999999 - 100000 + 1) * Rnd + 100000) & "_" & Format(Now, "yyyymmdd_hhnnss") & ".txt"
    
    ' Define o caminho (pasta do usuário ou pasta específica)
    caminhoArquivo = Environ("USERPROFILE") & "\Desktop\" & nomeArquivo
    
    ' Constrói o conteúdo do arquivo a partir do array
    For i = 1 To ultimoLinha
        For j = 1 To ultimaColuna
            If j > 1 Then
                conteudo = conteudo & ";"
            End If
            conteudo = conteudo & CStr(dadosArray(i, j))
        Next j
        conteudo = conteudo & vbCrLf
    Next i
    
    ' Salva o conteúdo no arquivo
    Open caminhoArquivo For Output As #1
    Print #1, conteudo
    Close #1
    
    ' Mensagem de confirmação
    MsgBox "Dados salvos com sucesso!" & vbCrLf & _
           "Arquivo: " & nomeArquivo & vbCrLf & _
           "Local: " & caminhoArquivo, vbInformation, "Sucesso"
    
End Sub

' Função alternativa para gerar nome aleatório mais simples
Function GerarNomeAleatorio() As String
    Randomize
    GerarNomeAleatorio = "export_" & Replace(CreateObject("Scriptlet.TypeLib").GUID, "{", "") & ".csv"
End Function

' Exemplo usando a função alternativa
Sub SalvarComNomeAlternativo()
    Dim ws As Worksheet
    Dim dadosArray() As Variant
    Dim nomeArquivo As String
    Dim caminhoArquivo As String
    Dim i As Long, j As Long
    Dim conteudo As String
    
    Set ws = ActiveSheet
    
    ' Carrega todos os dados usados na planilha para o array de uma vez
    dadosArray = ws.UsedRange.Value
    
    ' Gera nome aleatório usando a função
    nomeArquivo = GerarNomeAleatorio()
    caminhoArquivo = Environ("TEMP") & "\" & nomeArquivo
    
    ' Processa o array e cria o conteúdo CSV
    For i = LBound(dadosArray, 1) To UBound(dadosArray, 1)
        For j = LBound(dadosArray, 2) To UBound(dadosArray, 2)
            If j > LBound(dadosArray, 2) Then
                conteudo = conteudo & ","
            End If
            conteudo = conteudo & CStr(dadosArray(i, j))
        Next j
        conteudo = conteudo & vbCrLf
    Next i
    
    ' Salva o arquivo
    Open caminhoArquivo For Output As #1
    Print #1, conteudo
    Close #1
    
    MsgBox "Arquivo salvo: " & caminhoArquivo, vbInformation
End Sub
