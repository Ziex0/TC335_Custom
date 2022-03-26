Imports System.Net
Public Class Form1
    Public WithEvents download As WebClient
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Dim UserName As New Label
        UserName.Text = Environment.UserName
        TextBox1.Text = "C:\Users\" & UserName.Text & "\Downloads\"
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If My.Computer.FileSystem.FileExists(TextBox1.Text) Then
            MsgBox("Achtung! Die Datei existiert bereits und wird nun gelöscht und anschließend erneut heruntergeladen.")
            My.Computer.FileSystem.DeleteFile(TextBox1.Text)
        End If
        Try
            download = New WebClient
            download.DownloadFileAsync(New Uri(Label6.Text), TextBox1.Text)
            Button1.Enabled = False
        Catch ex As Exception
            MsgBox("Fehler! " & ex.Message)
        End Try
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged
        Select Case ComboBox1.SelectedIndex
            Case 0
                TextBox1.Text = TextBox1.Text & "enGB.7z"
                Label6.Text = "http://worldofwarcry.sytes.net:8091/wow/clientData/3.3.5/enGB.7z"
            Case 1
                TextBox1.Text = TextBox1.Text & "deDE.7z"
                Label6.Text = "http://worldofwarcry.sytes.net:8091/wow/clientData/3.3.5/deDE.7z"
        End Select
    End Sub

    Private Sub download_DownloadFileCompleted(sender As Object, e As System.ComponentModel.AsyncCompletedEventArgs) Handles download.DownloadFileCompleted
        Try
            If CheckBox1.Checked Then
                Button1.Enabled = True
                Label1.Text = "0 MB | 0 MB"
                Label2.Text = "0%"
                ProgressBar1.Value = 0
                Extraction.ShowDialog()
            Else
                Button1.Enabled = True
                Label1.Text = "0 MB | 0 MB"
                Label2.Text = "0%"
                ProgressBar1.Value = 0
            End If
        Catch ex As Exception
            MsgBox("Fehler! " & ex.Message)
        End Try
    End Sub

    Private Sub download_DownloadProgressChanged(ByVal sender As System.Object, ByVal e As System.Net.DownloadProgressChangedEventArgs) Handles download.DownloadProgressChanged
        Dim totalbytes As Long = e.TotalBytesToReceive / 1024
        Dim mtotalbytes As Long = totalbytes / 1024
        Dim bytes As Long = e.BytesReceived / 1024
        Dim mbytes As Long = bytes / 1024
        If totalbytes < 1 Then totalbytes = 1
        If bytes < 1 Then bytes = 1
        If totalbytes > 1024 Then
            Label1.Text = mbytes.ToString & " MB von " & mtotalbytes & " MB"
        Else
            Label1.Text = bytes.ToString & " KB von " & totalbytes & " KB"
        End If
        ProgressBar1.Value = e.ProgressPercentage
        Label2.Text = ProgressBar1.Value & "%"
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        End
    End Sub
End Class
