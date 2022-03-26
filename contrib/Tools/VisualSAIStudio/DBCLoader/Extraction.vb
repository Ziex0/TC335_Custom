Imports System.Windows.Forms

Public Class Extraction

    Private Sub OK_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        Me.DialogResult = System.Windows.Forms.DialogResult.OK
        Dim Szip As New Process
        Szip.StartInfo.FileName = "7z.exe"
        Szip.StartInfo.WorkingDirectory = "C:\Program Files\7-Zip\"
        Szip.StartInfo.Arguments = " x " & Form1.TextBox1.Text & " -o" & TextBox1.Text
        Szip.StartInfo.CreateNoWindow = True
        Szip.Start()
        Me.Close()
    End Sub

    Private Sub Cancel_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel_Button.Click
        Me.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If FolderBrowserDialog1.ShowDialog = DialogResult.OK Then
            TextBox1.Text = FolderBrowserDialog1.SelectedPath & "\"
        End If
    End Sub
End Class
