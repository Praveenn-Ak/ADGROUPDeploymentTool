#region ScriptForm Designer

#region Constructor

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

#endregion

#region Post-Constructor Custom Code

#endregion
#****************************************************************************************
$SiteCode = "ABC"
$siteserver = "Server-100"
#****************************************************************************************
$SMTP = "App-mail.abc.corp.com"
$FromAddress = "MECM_Automation@abc.com"
$CCAddress = "abc.SCCM.Ops@abc.com"
#**************************************************************************************** 

#region Form Creation
#Warning: It is recommended that changes inside this region be handled using the ScriptForm Designer.
#When working with the ScriptForm designer this region and any changes within may be overwritten.
#~~< Tool >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Tool = New-Object System.Windows.Forms.Form
$Tool.AutoSize = $true
$Tool.ClientSize = New-Object System.Drawing.Size(714, 654)
$Tool.Opacity = 0.95
$Tool.Text = "AdGroup Deployment Tool"
#~~~~Menustrip~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$MenuStrip = New-Object System.Windows.Forms.MenuStrip
$FileMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$ExitMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$HelpMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$AboutMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$HelpLinkMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$FileMenu.Text = "File"
$ExitMenu.Text = "Exit"
$HelpMenu.Text = "Help"
$AboutMenu.Text = "About!"
$HelpLinkMenu.Text = "Help?"
$ExitMenu.Add_Click({exitmenuclicked($ExitMenu) })
$AboutMenu.Add_Click({aboutmenuclicked($AboutMenu)})
$HelpLinkMenu.Add_Click({helpmenuclicked($HelpLinkMenu)})

$FileMenu.DropDownItems.Add($ExitMenu) | Out-Null
$HelpMenu.DropDownItems.Add($AboutMenu) | Out-Null
$HelpMenu.DropDownItems.Add($HelpLinkMenu) | Out-Null
$MenuStrip.Items.Add($FileMenu) | Out-Null
$MenuStrip.Items.Add($HelpMenu) | Out-Null
#~~< ButtonExit >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ButtonExit = New-Object System.Windows.Forms.Button
$ButtonExit.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$ButtonExit.Location = New-Object System.Drawing.Point(42, 535)
$ButtonExit.Size = New-Object System.Drawing.Size(90, 28)
$ButtonExit.TabIndex = 15
$ButtonExit.Text = "Exit"
$ButtonExit.UseVisualStyleBackColor = $true
$ButtonExit.add_Click({ButtonExitClick($ButtonExit)})
#~~< Labeladgroupname >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Labeladgroupname = New-Object System.Windows.Forms.Label
$Labeladgroupname.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$Labeladgroupname.Location = New-Object System.Drawing.Point(42, 266)
$Labeladgroupname.Size = New-Object System.Drawing.Size(176, 23)
$Labeladgroupname.TabIndex = 14
$Labeladgroupname.Text = "AD Group Name"
#~~< Labelappname >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Labelappname = New-Object System.Windows.Forms.Label
$Labelappname.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$Labelappname.Location = New-Object System.Drawing.Point(42, 207)
$Labelappname.Size = New-Object System.Drawing.Size(143, 23)
$Labelappname.TabIndex = 13
$Labelappname.Text = "Application Name"
#~~< Labeltech >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Labeltech = New-Object System.Windows.Forms.Label
$Labeltech.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$Labeltech.Location = New-Object System.Drawing.Point(42, 156)
$Labeltech.Size = New-Object System.Drawing.Size(100, 23)
$Labeltech.TabIndex = 12
$Labeltech.Text = "Technology"
#~~< Labelemaillist >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Labelemaillist = New-Object System.Windows.Forms.Label
$Labelemaillist.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$Labelemaillist.Location = New-Object System.Drawing.Point(42, 101)
$Labelemaillist.Size = New-Object System.Drawing.Size(136, 23)
$Labelemaillist.TabIndex = 11
$Labelemaillist.Text = "Approver Email"
#~~< LabelCRQ >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$LabelCRQ = New-Object System.Windows.Forms.Label
$LabelCRQ.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$LabelCRQ.Location = New-Object System.Drawing.Point(42, 51)
$LabelCRQ.Size = New-Object System.Drawing.Size(176, 23)
$LabelCRQ.TabIndex = 10
$LabelCRQ.Text = "CRQ REQ WO"
#~~< log >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$log = New-Object System.Windows.Forms.RichTextBox
$log.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$log.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$log.Location = New-Object System.Drawing.Point(204, 346)
$log.ReadOnly = $true
$log.Size = New-Object System.Drawing.Size(452, 240)
$log.TabIndex = 9
$log.Text = ""
#~~< TextBoxadgroup >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$TextBoxadgroup = New-Object System.Windows.Forms.TextBox
$TextBoxadgroup.BorderStyle = [System.Windows.Forms.BorderStyle]::None
$TextBoxadgroup.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$TextBoxadgroup.Location = New-Object System.Drawing.Point(404, 263)
$TextBoxadgroup.Size = New-Object System.Drawing.Size(252, 19)
$TextBoxadgroup.TabIndex = 8
$TextBoxadgroup.Text = ""
$TextBoxadgroup.add_TextChanged({TextBoxadgroupTextChanged($TextBoxadgroup)})
#~~< TextBoxappname >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$TextBoxappname = New-Object System.Windows.Forms.TextBox
$TextBoxappname.BorderStyle = [System.Windows.Forms.BorderStyle]::None
$TextBoxappname.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$TextBoxappname.Location = New-Object System.Drawing.Point(304, 211)
$TextBoxappname.Size = New-Object System.Drawing.Size(224, 19)
$TextBoxappname.TabIndex = 7
$TextBoxappname.Text = ""
$TextBoxappname.add_TextChanged({TextBoxappnameTextChanged($TextBoxappname)})
#~~< ComboBoxprogram >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ComboBoxprogram = New-Object System.Windows.Forms.ComboBox
$ComboBoxprogram.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$ComboBoxprogram.FormattingEnabled = $true
$ComboBoxprogram.Location = New-Object System.Drawing.Point(534, 207)
$ComboBoxprogram.SelectedIndex = -1
$ComboBoxprogram.Size = New-Object System.Drawing.Size(122, 26)
$ComboBoxprogram.TabIndex = 6
$ComboBoxprogram.Text = ""
$ComboBoxprogram.add_SelectedIndexChanged({ComboBox3SelectedIndexChanged($ComboBoxprogram)})
#~~< TextBoxcrq >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$TextBoxcrq = New-Object System.Windows.Forms.TextBox
$TextBoxcrq.BorderStyle = [System.Windows.Forms.BorderStyle]::None
$TextBoxcrq.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$TextBoxcrq.Location = New-Object System.Drawing.Point(304, 48)
$TextBoxcrq.Size = New-Object System.Drawing.Size(352, 19)
$TextBoxcrq.TabIndex = 5
$TextBoxcrq.Text = ""
#~~< ComboBoxtech >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ComboBoxtech = New-Object System.Windows.Forms.ComboBox
$ComboBoxtech.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$ComboBoxtech.FormattingEnabled = $true
$ComboBoxtech.Location = New-Object System.Drawing.Point(304, 156)
$ComboBoxtech.Size = New-Object System.Drawing.Size(352, 26)
$ComboBoxtech.TabIndex = 4
$ComboBoxtech.Text = ""
$ComboBoxtech.Items.AddRange([System.Object[]](@("Application", "Package", " ")))
$ComboBoxtech.SelectedIndex = -1
$ComboBoxtech.add_SelectedIndexChanged({ComboBoxtechSelectedIndexChanged($ComboBoxtech)})
#~~< ComboBoxemail >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ComboBoxemail = New-Object System.Windows.Forms.ComboBox
$ComboBoxemail.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$ComboBoxemail.FormattingEnabled = $true
$ComboBoxemail.Location = New-Object System.Drawing.Point(304, 101)
$ComboBoxemail.Size = New-Object System.Drawing.Size(352, 26)
$ComboBoxemail.TabIndex = 3
$ComboBoxemail.Text = ""
$ComboBoxemail.Items.AddRange([System.Object[]](@("sunil.huchaiah@cgi.com", "k.govindaraj@cgi.com", "akhil.joropalli@cgi.com","antonypraveen.kumar@cgi.com","varun.mc@cgi.com","mohanapriya.velusamy@cgi.com","suhasini.lambunoore@cgi.com","geeta.muddangoudar@cgi.com")))
$ComboBoxemail.SelectedIndex = -1
$ComboBoxemail.add_SelectedIndexChanged({ComboBox1SelectedIndexChanged($ComboBoxemail)})
#~~< CheckBoxifuser >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$CheckBoxifuser = New-Object System.Windows.Forms.CheckBox
$CheckBoxifuser.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$CheckBoxifuser.Location = New-Object System.Drawing.Point(304, 266)
$CheckBoxifuser.Size = New-Object System.Drawing.Size(94, 24)
$CheckBoxifuser.TabIndex = 2
$CheckBoxifuser.Text = "IF USER"
$CheckBoxifuser.UseVisualStyleBackColor = $true
$CheckBoxifuser.add_CheckedChanged({CheckBoxifuserCheckedChanged($CheckBoxifuser)})
#~~< Buttondeploy >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Buttondeploy = New-Object System.Windows.Forms.Button
$Buttondeploy.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$Buttondeploy.Location = New-Object System.Drawing.Point(42, 455)
$Buttondeploy.Size = New-Object System.Drawing.Size(90, 28)
$Buttondeploy.TabIndex = 1
$Buttondeploy.Text = "Deploy"
$Buttondeploy.UseVisualStyleBackColor = $true
$Buttondeploy.add_Click({ButtondeployClick($Buttondeploy)})
#~~< Buttonvalidate >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Buttonvalidate = New-Object System.Windows.Forms.Button
$Buttonvalidate.Font = New-Object System.Drawing.Font("Verdana", 11.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
$Buttonvalidate.Location = New-Object System.Drawing.Point(42, 362)
$Buttonvalidate.Size = New-Object System.Drawing.Size(90, 30)
$Buttonvalidate.TabIndex = 0
$Buttonvalidate.Text = "Vaidate"
$Buttonvalidate.UseVisualStyleBackColor = $true
$Buttonvalidate.add_Click({ButtonvalidateClick($Buttonvalidate)})
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$Tool.Controls.Add($ButtonExit)
$Tool.Controls.Add($Labeladgroupname)
$Tool.Controls.Add($Labelappname)
$Tool.Controls.Add($Labeltech)
$Tool.Controls.Add($Labelemaillist)
$Tool.Controls.Add($LabelCRQ)
$Tool.Controls.Add($log)
$Tool.Controls.Add($TextBoxadgroup)
$Tool.Controls.Add($TextBoxappname)
$Tool.Controls.Add($ComboBoxprogram)
$Tool.Controls.Add($TextBoxcrq)
$Tool.Controls.Add($ComboBoxtech)
$Tool.Controls.Add($ComboBoxemail)
$Tool.Controls.Add($CheckBoxifuser)
$Tool.Controls.Add($Buttondeploy)
$Tool.Controls.Add($MenuStrip)
#$Tool.Controls.Add($Buttonvalidate)
#region$Tool.Icon = ([System.Drawing.Icon](...)
$Tool.Icon = ([System.Drawing.Icon](New-Object System.Drawing.Icon((New-Object System.IO.MemoryStream(($$ = [System.Convert]::FromBase64String(
"AAABAAEAgIAAAAEAIAAoCAEAFgAAACgAAACAAAAAAAEAAAEAIAAAAAAAAAABAA47AAAOOwAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAQEAAMzMzADMzMwA2NjYAMzMzADMzMwAyMjIAMzMz"+
                                "ADMzMwAzMzMBMzMzATMzMwEzMzMBMzMzATMzMwEzMzMBMzMzATMzMwEzMzMBMzMzATMzMwEzMzMA"+
                                "MzMzADMzMwAzMzMAMzMzADU1NQA3NzcANjY2ACsrKwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA1NTUAOzs7"+
                                "ADQ0NAA0NDQAMjIyADIyMgEzMzMBMzMzAjMzMwMzMzMDMzMzBDMzMwQzMzMEMzMzAzMzMwMzMzMB"+
                                "LCwsAC0tLQAvLy8AMzMzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYGBgAxMTEAMTExACkpKQAz"+
                                "MzMBMzMzAzMzMwMzMzMEMzMzBDMzMwQzMzMEMzMzAzMzMwIzMzMBMzMzATQ0NAAzMzMAMzMzADIy"+
                                "MgAzMzMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwA0NDQANDQ0ADMzMwAzMzMAMzMzATMzMwMzMzME"+
                                "MzMzBDMzMwQzMzMCMDAwADAwMAA2NjYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJycnAD09PQBC"+
                                "QkIAMzMzAjMzMwczMzMLMzMzDDMzMw4zMzMQMzMzEDMzMw4zMzMMMzMzCzQ0NAczMzMCQ0NDAD4+"+
                                "PgAnJycAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMDAwADU1NQA1NTUAMjIyAjMzMwMzMzMEMzMz"+
                                "BDMzMwMzMzMBMzMzADMzMwAzMzMAMDAwADIyMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAADQ0NAAxMTEANzc3ADIyMgA0NDQBMzMzAjMzMwMzMzMEMzMzAzIyMgEzMzMAMzMzAAAAAAAu"+
                                "Li4AMzMzADQ0NAAxMTEEMzMzFDMzMyszMzM/MzMzVDMzM2szMzODMzMzlzMzM6czMzO4MzMzxjMz"+
                                "M84zMzPWMzMz3jMzM+QzMzPnMzMz6jMzM+0zMzPtMzMz6jMzM+czMzPkMzMz3jMzM9YzMzPOMzMz"+
                                "xjMzM7gzMzOnMzMzljMzM4QzMzNvMzMzWDMzM0EzMzMqMzMzEzMzMwQyMjIAMzMzADMzMwAAAAAA"+
                                "MzMzADMzMwA0NDQAMzMzAzMzMwQzMzMDMzMzAjMzMwEzMzMAMzMzADMzMwAzMzMAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMAMzMzADU1NQAz"+
                                "MzMAMzMzATMzMwMzMzMEMzMzAzIyMgAyMjIAMjIyADQ0NAA9PT0ANjY2ATMzMxQzMzM2MzMzVjMz"+
                                "M3ozMzOeMzMzwjMzM9ozMzPwMzMz/TMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/0zMzPvMzMz2jMzM8IzMzOiMzMzfTMzM1kz"+
                                "MzM1MzMzFDU1NQI0NDQANDQ0ADQ0NAA0NDQANDQ0ADMzMwMzMzMEMzMzAzMzMwEzMzMAKioqADQ0"+
                                "NAAzMzMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjIyADQ0NAAuLi4ANDQ0ADMzMwEzMzMDMzMzBDMz"+
                                "MwIzMzMAMzMzADQ0NAA1NTUANTU1BDMzMyAzMzNKMzMzfDMzM6szMzPPMzMz7zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/TQ0NPw0NDT7NDQ0+zQ0NPs0NDT7NDQ0/DMzM/wzMzP9"+
                                "MzMz/TMzM/0yMjL9MjIy/jIyMv4yMjL+MjIy/jIyMv4yMjL+MjIy/TMzM/0zMzP9MzMz/TMzM/w0"+
                                "NDT8NDQ0+zQ0NPs0NDT7NDQ0+zQ0NPw0NDT9MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzPwMzMz0jMzM6ozMzN7MzMzSjMzMyIzMzMEMjIyADMzMwA2NjYANjY2ADMzMwIzMzMEMzMz"+
                                "AzMzMwE0NDQAMTExADMzMwAzMzMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAzMzMAMzMzADMzMwAzMzMAMzMzAjMzMwQzMzMDAAAAAERERAAzMzMAMzMz"+
                                "ADMzMw8zMzM6MzMzbjMzM6czMzPZMzMz+DMzM/8zMzP/MzMz/zMzM/8zMzP/NDMz/jQ0NPw0NDT7"+
                                "NDQ0+zQ0M/wzMzP9MjIy/jExMf4wMDH/LzAw/y8vMP8vLy//Ly8w/zAwMP8wMDH/MTEx/zIyM/80"+
                                "NDP/NTU0/zY1Nf82Njb/NjY2/zc3Nv83Nzb/NjY2/zY2Nv82NTX/NTU0/zMzM/8yMjP/MTEx/zAw"+
                                "Mf8wMDD/Ly8w/y8vL/8vLzD/Ly8w/zAwMf8xMTH+MjIy/jMzM/00NDP8NDQ0+zQ0NPs0NDT8MzMz"+
                                "/jMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz+TMzM9gzMzOpMzMzcDMzMzo0NDQNMTExADIyMgAuLi4A"+
                                "Nzc3ADMzMwMzMzMEMzMzAjMzMwA1NTUAMzMzADMzMwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "ADMzMwAzMzMAMzMzADMzMwAzMzMCMzMzBDMzMwI0NDQAMzMzADMzMwAzMzMLMzMzOjMzM3czMzO2"+
                                "MzMz6jMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/TQ0NPs0NDT7MzMz/TIyMv4xMTH/LzAw/y8vL/8v"+
                                "LzD/MDAx/zMzM/83Nzb/PDw6/0FBP/9GRkP/S0tH/1FQTP9XVVD/W1lT/15dV/9iYFr/ZGNb/2Zk"+
                                "Xf9oZl7/amhg/2ppYf9raWH/bGph/2xqYf9raWH/amlh/2poYP9oZl7/ZmRd/2RjW/9iYFr/Xl1X"+
                                "/1pZU/9WVVD/UlFM/01MSP9HRkP/QUE//zw7Ov83Njb/MzMz/zAwMf8vLzD/Ly8v/y8wMP8xMTH/"+
                                "MjIy/jMzM/00NDT7NDQ0+zQ0M/0zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM+kzMzO1MzMzdzMzMzoz"+
                                "MzMKMjIyADIyMgAzMzMANDQ0ATMzMwQzMzMCMzMzAC8vLwAyMjIANDQ0AAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzADQ0NAA0NDQA"+
                                "MzMzADMzMwIzMzMEMzMzATQ0NAA1NTUAPz8/ADMzMyEzMzNhMzMzpjMzM+QzMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/jQ0NPs0NDT7MzMz/TIyMv4wMDH/Ly8w/y8vMP8xMTL/NjY1/z09O/9GRUL/Tk1J/1ZV"+
                                "UP9fXlf/ZmRd/2tpYf9vbWT/cnBn/3NxaP90cmj/dHJp/3RyaP90cmj/c3Fo/3NxZ/9zcGf/cnBn"+
                                "/3JwZv9yb2b/cW9m/3FvZv9xb2b/cW9m/3FvZv9xb2b/cm9m/3JwZ/9ycGf/c3Bn/3NxZ/9zcWj/"+
                                "dHJo/3RyaP90cmn/dHJo/3NxaP9ycGf/b21k/2tpYf9mZF3/X15X/1dWUf9OTUn/RUVC/z08O/82"+
                                "NjX/MTEy/y8vMP8vMDD/MTEx/zIyMv4zMzP9NDQ0+zQ0NPszMzP+MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M+MzMzOoMzMzYDMzMyAAAAAAMDAwADExMQAzMzMBMzMzBDMzMwIzMzMANTU1ADQ0NAAzMzMAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAyMjIAMjIyACwsLAAxMTEAMzMzAjMzMwQ0"+
                                "NDQBNDQ0ADU1NQA1NTUDMzMzLzMzM3gzMzPEMzMz+DMzM/8zMzP/MzMz/zMzM/40NDT7NDQ0/DMz"+
                                "M/4xMTH/Ly8w/y8vMP8xMTL/ODg3/0FAPv9LS0f/WFdR/2JgWf9qaGD/cG5l/3NxaP90cmj/dHJo"+
                                "/3NxaP9ycGf/cW9m/3BuZf9wbmX/b21k/29tZP9vbWT/b21k/29tZP9vbWT/b21k/29tZf9vbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/29uZf9vbWX/b21k/29tZP9v"+
                                "bWT/b21k/29tZP9vbWT/b21k/3BuZf9wbmX/cW9m/3JwZ/9zcWj/dHJo/3RyaP9zcWf/cG5l/2po"+
                                "YP9iYVr/V1ZQ/0lIRf8/Pj3/Nzc2/zIyMv8vLzD/MDAw/zExMv8zMzP+NDQ0/DQ0NPszMzP+MzMz"+
                                "/zMzM/8zMzP/MzMz+DMzM8QzMzN5MzMzLjExMQIuLi4AUVFRADMzMwEzMzMEMzMzAjQ0NAA1NTUA"+
                                "MzMzADIyMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAACsrKwAyMjIANDQ0ADU1NQAzMzMBMzMzBDMzMwIvLy8ARUVFADQ0"+
                                "NAIzMzMuMzMzfjMzM9EzMzP9MzMz/zMzM/8zMzP/NDQ0/DQ0NPszMzP9MTEy/y8vMP8vLzD/MzMz"+
                                "/zw7Ov9HR0T/VVRP/2JhWv9samL/cnBm/3RyaP90cmj/c3Fn/3FvZv9wbmX/b21k/29tZP9vbWT/"+
                                "b21k/29tZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/b25l/29tZP9vbWT/b21k/29tZP9wbmX/cnBm"+
                                "/3JwZ/9ta2P/a2lh/2lnX/9kYlv/XFpU/1FQS/9FREL/Ojo5/zMzM/8vMDD/MDAw/zIyMv8zMzP9"+
                                "NDQ0+zQ0M/wzMzP/MzMz/zMzM/8zMzP9MzMzzzMzM38zMzMtODg4ASwsLAAzMzMAMzMzAjMzMwQz"+
                                "MzMBMzMzADQ0NAAyMjIAMzMzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAADU1NQAzMzMANDQ0ADQ0NAAzMzMCMzMzBDU1NQAyMjIAMjIyADMzMx8zMzNzMzMz"+
                                "zDMzM/0zMzP/MzMz/zMzM/40NDT7NDQ0/DMzM/4wMDH/Ly8v/zExMv86Ojn/SEdE/1dWUP9lZFz/"+
                                "b21k/3NxaP90cmj/c3Fn/3FvZv9wbmX/b21k/29tZP9vbWT/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9vbWT/"+
                                "aWde/2dlXf9nZV3/aGZe/2lnX/9raGD/bGph/2tpYP9nZV3/Xl1W/1NRTf9FREL/OTk4/zIyMv8v"+
                                "LzD/MDEx/zMzM/40NDT8NDQ0+zMzM/4zMzP/MzMz/zMzM/wzMzPLMzMzcjMzMx8yMjIAMjIyADQ0"+
                                "NAAzMzMEMzMzAjIyMgAvLy8AMjIyADU1NQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "ADMzMwAzMzMAMzMzADQ0NAAzMzMDMzMzAjMzMwAzMzMAMzMzCjMzM1UzMzO2MzMz9jMzM/8zMzP/"+
                                "MzMz/jQ0NPs0NDT9MjIy/zAwMP8vLzD/NDQ0/0FAPv9SUUz/YmBZ/25sY/90cWj/dHJo/3JwZ/9w"+
                                "bmX/b21k/29tZP9vbWT/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/b21k/2lnX/9o"+
                                "Zl7/aGZe/2hmXv9oZl7/aGZe/2dlXv9nZV3/Z2Vd/2hmXv9qaGD/bGlh/2tpYP9mZF3/XFpU/01M"+
                                "SP8/Pz3/NDQ0/y8wMP8wMDH/MjIz/zQ0NP00NDT7MzMz/jMzM/8zMzP/MzMz9zMzM7QzMzNTMzMz"+
                                "CzIyMgAzMzMAMzMzAjMzMwMzMzMAMzMzADMzMwA0NDQAAAAAAAAAAAAAAAAAAAAAAAAAAAAyMjIA"+
                                "MzMzADMzMwAzMzMCMzMzATMzMwAzMzMAMzMzKDMzM4gzMzPjMzMz/zMzM/4zMzP/NDQ0+zQ0NPwy"+
                                "MzP/MDAw/y8vMP82NjX/RURB/1dWUP9oZl7/cnBm/3Ryaf9zcWf/cW9m/29tZP9vbWT/b21l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/29tZP9pZ1//aGZe/2hm"+
                                "Xv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9nZV3/Z2Vd/2hmXv9raGD/bGph"+
                                "/2lnX/9hX1j/U1FN/0JCQP81NTX/MDAw/zAwMf8zMzP/NDQ0/DQ0M/szMzP/MzMz/jMzM/8zMzPi"+
                                "MzMziDMzMyc0NDQANDQ0ADMzMwEzMzMCMzMzADMzMwAzMzMAAAAAAAAAAAAAAAAAAAAAADQ0NAA0"+
                                "NDQANDQ0ATU1NQA0NDQEMzMzRzMzM7MzMzP6MzMz/zMzM/8zMzP8NDQ0/DMzM/4wMDH/Ly8w/zU1"+
                                "Nf9EQ0H/WFdR/2poYP9zcWf/dHJo/3JwZ/9wbmX/b21k/29tZP9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9vbWT/aWdf/2hmXv9oZl7/aGZe"+
                                "/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2dlXv9nZV3/"+
                                "aGZe/2poX/9saWH/amhg/2NhWv9UUk3/QkE//zQ0NP8vLzD/MTEx/zMzM/40NDT8MzMz/DMzM/8z"+
                                "MzP/MzMz+TMzM7MzMzNHMzMzAzMzMwAzMzMBMzMzADMzMwAAAAAAAAAAAAAAAAAAAAAAMzMzADMz"+
                                "MwIzMzMAMzMzPTMzM9YzMzP/MzMz/zMzM/40NDT7NDQ0/TIyMv8vLzD/MjIy/0A/Pf9VVE//aWdf"+
                                "/3NxZ/90cmj/cW9m/29tZP9vbWT/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/b21k/2lnX/9oZl7/aGZe/2hmXv9oZl7/"+
                                "aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9o"+
                                "Zl7/aGZe/2dlXf9nZV7/aWdf/2xpYf9qaGD/YWBZ/1BPS/8+PTz/MjIy/y8vMP8yMjL/NDQ0/TQ0"+
                                "M/szMzP+MzMz/zMzM/8zMzPUMzMzOjMzMwAzMzMCMzMzAAAAAAAAAAAAAAAAAAAAAAAzMzMBNDQ0"+
                                "ADQ0NAMzMzPVMzMz/zMzM/szMzP8MzMz/jAwMf8vLzD/ODg3/01MSP9kYlv/cW9m/3RyaP9ycGb/"+
                                "b21l/29tZP9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/29tZP9pZ1//aGZe/2hmXv9oZl7/aGZe/2hmXv9o"+
                                "Zl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hm"+
                                "Xv9oZl7/aGZe/2hmXv9oZl7/Z2Vd/2dlXv9qZ1//bGph/2lnX/9dW1X/SUhF/zc3N/8wMDD/MTEx"+
                                "/zMzM/4zMzP8MzMz+zMzM/8zMzPRMDAwAjExMQAzMzMBAAAAAAAAAAAAAAAAAAAAADMzMwEzMzMA"+
                                "MzMzDTMzM+czMzP/MzMz/jMzM/8yMjL/QEA+/1lYUv9ta2L/dHJo/3NxZ/9wbmX/b21k/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9vbWT/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hm"+
                                "Xv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe"+
                                "/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9nZV3/aGZe/2poYP9saWH/ZWNb/1RTTv8/Pjz/"+
                                "MzMz/zMzM/8zMzP9MzMz/zMzM+MzMzMLMzMzADMzMwEAAAAAAAAAAAAAAAAAAAAAMjIyADQ0NAE0"+
                                "NDQAMzMzxzMzM/80NDP8MDAx/1ZVUP90cmj/dHFo/3FvZv9vbWT/b21l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/29tZP9v"+
                                "bWT/b21k/29tZP9vbWT/b21k/29tZP9vbWT/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/bm1k/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe"+
                                "/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/"+
                                "aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/Z2Ve/2dlXf9pZ1//a2lh/2tpYf9R"+
                                "UEv/MTEx/zQ0M/wzMzP/MzMzwzMzMwAzMzMCMzMzAAAAAAAAAAAAAAAAAAAAAAAzMzMAMzMzAzMz"+
                                "MwAzMzOiMzMz/zQ0NPsvLzD/WVdS/3RyaP9ubGP/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9vbWT/b21k/3BuZf9ycGb/c3Fo/3Ry"+
                                "aP90cmn/dHJo/3RyaP90cmn/dHJo/3NxaP9ycGb/cG5l/29tZP9vbWT/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cW9l/25sZP9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/"+
                                "aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9o"+
                                "Zl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9mZF3/bGph/1NR"+
                                "Tf8vMDD/NDQ0+zMzM/8zMzOcMzMzADMzMwMzMzMAAAAAAAAAAAAAAAAAAAAAADQ0NAAzMzMEMzMz"+
                                "ADMzM3kzMzP/NDQ0+y8vMP9MS0j/dHJo/29tZP9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9vbWT/cG5l/3NxaP90cmj/cW9m/2hnX/9fXVf/VlVP"+
                                "/1BPSv9NTEj/TUxI/1BPS/9WVVD/X15X/2lnX/9xb2b/dHJp/3NxZ/9wbmX/b21k/3BuZf9wbmX/"+
                                "cG5l/3FvZf9ubGP/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9o"+
                                "Zl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hm"+
                                "Xv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2dlXf9raWH/SEdE"+
                                "/y8wMP80NDT7MzMz/zMzM3QzMzMAMzMzBDQ0NAAAAAAAAAAAAAAAAAAAAAAAJiYmADMzMwMzMzMA"+
                                "MzMzTTMzM/80NDP8MDAx/0A/Pf9wbmX/b21k/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/29tZP9vbWT/cnBn/3Ryaf9vbWT/YV9Y/05NSf8+Pjz/NTU0/zAwMf8vLzD/"+
                                "Ly8v/y8vMP8vLzD/Ly8v/y8vMP8wMTH/NTU1/z8+Pf9PTkr/YmBZ/3BuZf90cmn/cnBm/29tZP9w"+
                                "bmX/bmxj/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hm"+
                                "Xv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe"+
                                "/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2lnXv89PTv/"+
                                "MTEx/zMzM/0zMzP/MzMzRzMzMwAzMzMDTExMAAAAAAAAAAAAAAAAAAAAAAAzMzMAMzMzAjMzMwAz"+
                                "MzMeMzMz9DMzM/8zMzP+MzMz/2tpYv92dGv/b21k/29tZP9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/29tZP9vbWX/c3Fn/3NxaP9nZl7/UVBM/zw8Ov8xMTH/Ly8w/zExMf8zMzP/NDQz/zQ0NP80"+
                                "NDT/NDQ0/zQ0NP80NDT/NDQ0/zQ0M/8yMjP/MDEx/y8vL/8xMTH/PT07/1JRTP9oZl//dHJo/3Bu"+
                                "Zf9oZl7/Z2Vd/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe"+
                                "/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/"+
                                "aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9qaGD/X11W/zMzM/8z"+
                                "MzP+MzMz/zMzM/AzMzMZMzMzADMzMwEwMDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMANDQ0ATQ0"+
                                "NAAzMzO8MzMz/zQ0NPwuLi7/V1dU/4aFfv98e3P/dXNq/29tZP9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/29tZP9w"+
                                "bmX/c3Fo/3JwZ/9iYFn/R0dE/zQ0NP8vLy//MTEx/zMzM/80NDT/NDQz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDP/NDQ0/zMzM/8xMTH/Ly8v/zQ0NP9IR0T/XFtV"+
                                "/2poYP9raWD/aGZe/2dlXf9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/"+
                                "aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9o"+
                                "Zl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/Z2Vd/2xqYf9KSUb/Ly8w/zQ0"+
                                "NPwzMzP/MzMztjQ0NAA0NDQCMjIyAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwAzMzMEMzMz"+
                                "ADMzM2MzMzP/MzMz/DIyMv82NjX/d3Zw/4OCe/+Af3j/d3Vt/29tY/9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/29tZP9wbmX/c3Fo/3Jw"+
                                "Z/9gXlj/Q0NA/zExMf8vLzD/MzMz/zQ0NP8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQzM/80NDT/MzMz/y8vMP8xMjL/"+
                                "QUE//1pYUv9qaF//a2lg/2hmXv9nZV3/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9o"+
                                "Zl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hm"+
                                "Xv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2dlXv9qaF//YWBZ/zQ0NP8zMzP/MzMz"+
                                "/DMzM/8zMzNcMzMzADMzMwMzMzMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzADMzMwE0NDQA"+
                                "NDQ0DTMzM94zMzP/NDQ0/S8vL/9KSkf/hIN7/39+d/+Af3j/eHZu/3BuZf9vbWT/b21k/3BuZf9w"+
                                "bmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3Bu"+
                                "Zf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/29tZP9vbWT/c3Fo/3JwZ/9fXVf/QUE/"+
                                "/zAxMf8wMDD/MzMz/zQ0NP8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/zMzM/8w"+
                                "MDH/MTEx/z8/Pf9ZV1L/amhf/2tpYP9nZl7/Z2Vd/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hm"+
                                "Xv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe"+
                                "/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2toYP9CQT//MDAx/zQ0NP0zMzP/"+
                                "MzMz2TMzMwozMzMAMzMzATIyMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAyMjIANDQ0ADMzMwMz"+
                                "MzMAMzMzaDMzM/8zMzP7NDQ0/y4uL/9ZWFX/hoV+/39+d/+Af3n/fXx1/3d1bf9zcWj/cG5l/29t"+
                                "ZP9vbWT/cG5k/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l"+
                                "/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/29tZf9vbWT/c3Fn/3NxZ/9hX1n/Q0JA/zAwMf8wMDH/"+
                                "NDQz/zQ0NP8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQ0"+
                                "NP80MzP/MDAx/zExMf9AQD7/WllT/2poYP9raGD/Z2Vd/2dmXv9oZl7/aGZe/2hmXv9oZl7/aGZe"+
                                "/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/"+
                                "aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/Z2Ze/2hmXv9samH/TEtH/zAwMP80NDT/MzMz+zMzM/8z"+
                                "MzNiMzMzADMzMwMzMzMAMzMzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMAMzMzADMz"+
                                "MwFvb28AMzMzvDMzM/8zMzP7NDQ0/y8vL/9aWVb/hYR8/4GAef9/fnf/gYB5/4B/eP99fHX/enhw"+
                                "/3V0a/9ycGf/cG5l/29tZP9vbWT/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/cG5l/3BuZf9wbmX/"+
                                "cG5l/3BuZf9wbmX/cG5l/3BuZf9vbWT/cnBn/3RyaP9kYlv/RURB/zExMf8wMDD/NDQz/zQ0NP8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/80NDT/NDQz/zAwMf8xMTH/QkE//1xaVP9raWD/amhg/2dlXf9oZl7/aGZe/2hmXv9oZl7/"+
                                "aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9o"+
                                "Zl7/aGZe/2hmXv9oZl7/aGZe/2dlXf9pZ1//a2lh/01MSP8wMDH/MzMz/zMzM/szMzP/MzMztzMz"+
                                "MwAzMzMBMzMzADMzMwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADU1NQATExMAMzMz"+
                                "AjMzMwAzMzMiMzMz5zMzM/8zMzP8NDQz/y4uL/9NTEr/enpz/4aFff+BgHn/f353/39+eP+BgHn/"+
                                "gYB5/39+d/98e3T/eHdv/3Ryav9xb2b/b21k/29tZP9vbWT/cG5l/3BuZf9wbmX/cG5l/3BuZf9w"+
                                "bmX/cG5l/29tZP9vbWT/cnBm/3RyaP9nZV3/SUhF/zIyMv8vMDD/MzMz/zQ0NP8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/NDQ0/zMzM/8wMDH/MjIy/0RDQf9fXVf/a2lh/2poX/9nZV3/Z2Vd/2hmXv9o"+
                                "Zl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hm"+
                                "Xv9oZl7/Z2Vd/2dlXf9pZ1//bGph/2RiW/9EQ0H/MDAw/zMzM/8zMzP8MzMz/zMzM+QzMzMfMzMz"+
                                "ADMzMwIyMjIAMzMzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwAzMzMA"+
                                "MzMzAzMzMwAzMzM9MzMz9DMzM/8zMzP7NDQ0/y4uL/84ODj/XFxY/3l4cv+Eg3z/hYR8/4KBev9/"+
                                "fnf/f353/4B/eP+BgHn/gYB5/39+dv97enL/d3Vt/3Nxaf9wbmX/b21k/29tZP9vbWT/b21k/29t"+
                                "ZP9wbmX/c3Fn/3RyaP9oZ1//TExI/zQ0M/8vLzD/MzMz/zQ0NP8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQ0NP80NDT/NDQ0/zQ0NP80NDT/NDQ0/zQ0NP80"+
                                "NDT/MzMz/zMzM/8zMzP/MzMz/zQ0NP8zMzP/MDAw/zMzM/9HR0P/YF5Y/2tpYf9raWD/aGZe/2dl"+
                                "Xf9nZV7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9oZl7/aGZe/2hmXv9nZV3/aGZe"+
                                "/2lnX/9raWH/a2lg/2NhWv9PTkr/NjY2/zAwMP80NDT/MzMz+zMzM/8zMzPyMzMzOTMzMwAzMzMD"+
                                "MzMzADMzMwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMTExADMzMwAy"+
                                "MjIAMzMzAzMzMwAzMzM+MzMz7TMzM/8zMzP7NDQ0/TIyMv8uLi7/Nzc2/0pKSP9iYV3/d3Zw/4OC"+
                                "ev+FhH3/g4J6/4B/eP9/fnf/f394/4B/ef+Af3n/f353/317dP95d3D/dXNr/3NxaP9zcWj/dHJp"+
                                "/3FvZv9iYVr/SklG/zQ0NP8vLzD/MzMz/zQ0NP8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/NDQ0/zQ0NP8yMjL/Ly8v/ywsLP8pKSn/KCgo/ygoKP8pKSn/Kysr/y8v"+
                                "L/8yMjL/NDQ0/zQ0NP8zMzP/MzMz/zMzM/80NDT/MzMz/y8wMP80NDT/RUVC/1tZU/9oZl7/bGph"+
                                "/2tpYP9pZ1//aGZe/2dlXf9nZV3/Z2Vd/2dlXv9oZl7/Z2Ve/2dlXf9oZl7/amhf/2xpYf9qaGD/"+
                                "YmFZ/1RTTv9EQ0D/NTU1/y8vMP8yMjL/NDQ0/TMzM/szMzP/MzMz6zMzMzozMzMAMzMzAzMzMwAz"+
                                "MzMANTU1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANTU1ADIy"+
                                "MgAyMjIAMzMzAzMzMwAzMzMkMzMzyTMzM/8zMzP9MzMz+zQ0NP0yMjL/Li8v/y4uL/81NTX/RkZE"+
                                "/15dWf9zcmz/gYB5/4WEff+Eg3v/goF6/4OCe/+Eg3z/hoV9/4aFfv+Eg3z/fHt1/2xqZf9TUk7/"+
                                "Pj48/zIyMv8vLzD/MzMz/zQ0NP8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zQ0NP8wMDD/KSkp/yQkJP8hISH/ISEh/yEhIf8hISH/ISEh/yEhIf8hISH/ISEh"+
                                "/yQkJP8pKSn/MDAw/zQ0NP8zMzP/MzMz/zMzM/8zMzP/NDQ0/zMzM/8wMDD/MTEx/zw7Ov9LS0f/"+
                                "WllT/2VjW/9qaF//bGlh/2xqYf9raWD/a2hg/2poYP9qaGD/bGph/2poX/9hX1j/UlFM/0FBP/81"+
                                "NTX/MDAw/zAwMP8yMjL/NDQ0/TMzM/szMzP9MzMz/zMzM8czMzMiMzMzADMzMwM0NDQAMzMzADMz"+
                                "MwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANDQ0"+
                                "ADMzMwAzMzMAMzMzAxcXFwA0NDQFMzMzczMzM+0zMzP/MzMz/jMzM/40NDT7NDQ0/DIyMv4vLy//"+
                                "Li4u/zMzM/9CQkH/WVhV/25taP90c23/cXBq/2tqZf9iYl3/VlZT/0lIRv87Ozr/MjIy/y8vL/8x"+
                                "MTH/MzMz/zQ0NP8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zQ0NP8yMjL/KSkp/yIiIv8hISH/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yEhIf8iIiL/KSkp/zIyMv80NDT/MzMz/zMzM/8zMzP/MzMz/zQ0NP8zMzP/MTEx/y8vMP8x"+
                                "MTH/Nzc3/0BAPv9KSUX/UlFM/1hXUf9cWlT/Xl1W/11bVf9QT0v/QD89/zQ0NP8vMDD/MDAx/zIy"+
                                "M/80NDT9NDQ0+zMzM/4zMzP+MzMz/zMzM+0zMzNyNDQ0BDExMQAzMzMDMzMzADMzMwAzMzMAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "MzMzADMzMwAzMzMAMzMzAjMzMwMzMzMAMzMzFTMzM3czMzPUMzMz/jMzM/8zMzP/MzMz/zQ0NPs0"+
                                "NDT8MzMz/jAwMP8uLi7/MTEx/zQ0NP8yMjL/MDAw/y4uL/8uLi7/Ly8v/zExMf8zMzP/NDQ0/zQ0"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/"+
                                "MDAw/yQkJP8hISH/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8hISH/JCQk/y4uLv80NDT/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/zMz"+
                                "M/8yMjL/MDAx/y8vMP8wMDD/MDAx/zExMv8zMzP/MjIy/y8vMP8wMDH/MzMz/jQ0NPw0NDT7MzMz"+
                                "/jMzM/8zMzP/MzMz/jMzM9MzMzN2MzMzFDMzMwAzMzMDMzMzAjMzMwAzMzMAMzMzAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAMjIyADMzMwAzMzMAMzMzATMzMwMzMzMBMzMzADMzMwQzMzMzMzMzfTMzM8kzMzP6MzMz/zMz"+
                                "M/8zMzP/NDQ0/DQ0NP0zMzP/MzMz/zMzM/80NDT/NDQ0/zQ0NP80NDT/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/y8vL/8i"+
                                "IiL/ISEh/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/ISEh/ykpKf8yMjL/NDQ0/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/80NDP/NDQ0/zQ0NP80NDP/MzMz/zMzM/8zMzP/NDQ0/TQ0M/szMzP/MzMz/zMzM/8zMzP8"+
                                "MzMzzzMzM4IzMzMzMjIyAzIyMgAyMjIBMzMzAzMzMwEzMzMAMzMzADMzMwAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAADMzMwAzMzMAMzMzADMzMwEzMzMENDQ0ATU1NQA0NDQAMjIyADMzMyUzMzNuMzMz"+
                                "uzMzM/QzMzP/MzMz/jMzM/wzMzP+MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQ0NP8uLi7/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/ISEh/yQkJP8uLi7/NDQ0/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/jMzM/wzMzP+MzMz/zMzM/kzMzPGMzMzeDMzMyw1"+
                                "NTUCOTk5ADIyMgAzMzMBMzMzBDMzMwEzMzMAMzMzADMzMwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAxMTEANDQ0ADY2NgAzMzMAMzMzAzMzMwQzMzMBNDQ0ADQ0NAA3NzcA"+
                                "MzMzGDMzM2gzMzPgMzMz/zMzM/wzMzP8MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/Li4u/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/ISEh/yEhIf8pKSn/MzMz/zQ0NP8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/wzMzP8MzMz/zMzM90zMzNxMzMzJCkpKQA1NTUANDQ0ADIy"+
                                "MgEzMzMEMzMzAzMzMwAzMzMAMzMzADIyMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADIyMgA0NDQANzc3ADMzMwAzMzMCMzMzBDMzMwIz"+
                                "MzMBMjIyADMzMw0zMzOOMzMz+zMzM/8zMzP8MzMz/TMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/y4uLv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yEhIf8kJCT/Ly8v/zQ0NP8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/0zMzP8MzMz/zMzM/kzMzOHNDQ0CzQ0NAAzMzMBNDQ0ATMzMwQzMzMCNDQ0"+
                                "ADExMQAzMzMAMzMzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANDQ0ADIyMgArKysAMzMzADMz"+
                                "MwIzMzMEMzMzAjQ0NAAzMzMxMzMzxTMzM/8zMzP9MzMz/DMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQ0NP8vLy//IyMj/yIiI/8jIyP/IyMj/yMjI/8j"+
                                "IyP/IiIj/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yEhIf8hISH/KSkp/zMzM/80NDT/MzMz"+
                                "/zMzM/4zMzP8MzMz/TMzM/8zMzPAMzMzLDMzMwAzMzMCMzMzBDMzMwIyMjIALi4uADIyMgAzMzMA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMAMzMz"+
                                "ADMzMwAzMzMBMzMzAx0dHQAtLS0BMzMzZjMzM+szMzP/MzMz/DMzM/0zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/83Nzf/MDAw/yAgIP8fHx7/IB8f/x8fHv8fHx//Hx8f/x8f"+
                                "Hv8hISD/JCQk/yQkJf8jIyP/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8hISH/JCQk/y8vL/80NDT9"+
                                "MzMz/DMzM/8zMzPpMzMzYCkpKQAyMjIAMzMzAzMzMwEzMzMAMzMzADMzMwAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMA"+
                                "MjIyADY2NgA0NDQAMzMzAzMzMwMzMzMAMzMzFzMzM6EzMzP/MzMz/zMzM/wzMzP+MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/81NTX/MzMz/yMjIP8bGhn/Jygp/ywtL/8sLC//LCwv/ywsL/8sLC//LC0v"+
                                "/yYnKP8bGhf/GBcU/yAgIP8kJCX/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8hISH+IiIi+ykpKf8y"+
                                "MjL+MzMzmjIyMhQzMzMAMzMzAzMzMwI0NDQANDQ0ADIyMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAMjIyADMzMwAzMzMAMzMzATMzMwMzMzMCNDQ0ADMzM0AzMzPTMzMz/zMzM/0zMzP8MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/NTY2/ysrKf8yMjP/aG18/5qhvP+yu9v/usPl/6+64/+rt+L/rLjj/6y34v+tuOP/"+
                                "pK7V/42Vtv9iZ3n/Jyco/xkYFv8kJCX/IyMj/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/CIiIvwiIiL/IiIi1yoq"+
                                "KkAdHR0AJCQkAjMzMwMzMzMAMzMzADMzMwA0NDQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAADMzMwAzMzMAMzMzADMzMwIzMzMDMzMzADMzMwczMzN4MzMz9DMzM/8zMzP8MzMz"+
                                "/TMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "NDQ0/zQ0NP8oKCX/WFpk/6631//R3P//ztj+/8nT+v/J0/j/w872/7rG9P+5xfT/ucX0/7nF9P+6"+
                                "xvb/vcr7/8HO//+krtb/TE9c/xgXFP8iIiL/IyQk/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/SIiIvwiIiL/IyMj9iQkJH0wMDAIMTEx"+
                                "ADExMQMzMzMCMzMzADMzMwAyMjIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAADMzMwAzMzMAMTExADIyMgAzMzMDMzMzAzMzMwAzMzMiMzMzszMzM/8zMzP+"+
                                "MzMz/DMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zU1Nf8x"+
                                "MTD/LS0r/36Ckv/L1vr/y9X7/8LM8P/DzfH/xM7z/8TO8//Fz/P/xM7z/8PN8//DzfP/ws3z/8HL"+
                                "8v+9x/D/tcDs/7rG9/++yvr/dnyV/x8fHv8eHh3/JCQl/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIvwiIiL+IiIi/yMjI7gnJyclIiIiACAgIAMqKioD"+
                                "AAAAAP///wAzMzMANjY2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAA0NDQAMzMzADMzMwAzMzMBMzMzAzQ0NAE2NjYAMzMzUTMzM+Ez"+
                                "MzP/MzMz/jMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/81NTb/Li4t/zY2"+
                                "N/+do7r/1+D//8XP8//DzfL/xc/0/8XP9P/Fz/T/xc/0/8XP9P/Fz/T/xc/0/8XP9P/Fz/T/xtD0"+
                                "/8bQ9P/Fz/T/u8bv/7TA7v/Bzv//lJ2//yorLf8cGxr/JSUl/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL+IiIi/yMjI+QkJCRXDg4OABYWFgEjIyMEJycnASYmJgAl"+
                                "JSUAKioqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzADIyMgAyMjIAMzMzAjMzMwMyMjIAMjIyDDMz"+
                                "M5EzMzP/MzMz/jMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/NTU2/y0tLP8+PkH/r7bR"+
                                "/9bg///I0fH/xs/0/8XP9P/Fz/T/xc/0/8XP9P/Fz/T/xc/0/8XP9P/Fz/T/xc/0/8XP9P/Fz/T/"+
                                "xc/0/8XP9P/G0PT/wMvy/7O/7P+/zP3/pK7V/zQ1Ov8bGhj/JSUl/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/iIiIv8jIyOWKSkpDyYmJgAhISEDJSUlAiAgIAAeHh4AKSkpAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANjY2ADIyMgAyMjIAMjIyADMzMwUzMzMAMzMz"+
                                "GTMzM/MzMzP/MzMz/jMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zU1Nv8uLSz/P0BD/7a+2v/U3f//"+
                                "yNHx/8vU9f/G0PT/xc/0/8XP9P/Fz/T/xtD1/8bQ9f/G0PX/xtD1/8bQ9f/G0PX/xtD1/8bQ9f/F"+
                                "z/T/xc/0/8XP9P/G0PT/w830/7XA7P+8yfr/q7Xe/zY3Pf8bGxn/JCUl/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv4iIiL/IiIi7yIiIhAjIyMAIyMjBCoqKgApKSkAJiYmACoqKgAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADQ0NAAyMjIAMzMzATMzMwAzMzMd"+
                                "MzMz9DMzM/8zMzP+MzMz/zMzM/8zMzP/MzMz/zMzM/81NTX/Ly8u/zo7PP+zu9f/1N3//8jR8f/L"+
                                "1PX/y9T1/8bQ9P/Fz/T/xtD1/8XP9P/DzPH/w83x/8PN8f/DzfH/w83x/8PN8f/DzfH/w8zx/8XP"+
                                "9P/Fz/X/xc/0/8XP9P/G0PT/xM70/7XB7f+8yPn/qLLb/y8wM/8dHRv/JCQl/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/iIiIv8iIiLuIiIiFCAgIAAiIiIBIyMjACgoKAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADk5OQAzMzMCMzMzADMzMxoz"+
                                "MzP0MzMz/zMzM/4zMzP/MzMz/zMzM/8zMzP/NDQ0/zIyMv8xMTH/p67H/9Xe///I0fH/y9T1/8vU"+
                                "9f/K0/T/xc/z/8XP9P/EzvP/qa/Q/6Oox/+kqcn/pKnI/6SpyP+kqcj/pKnI/6Spyf+ip8b/rLLT"+
                                "/8XP9P/Fz/T/xM7z/8TO8//G0PT/xM70/7XB7f+9yvv/nKbL/yUlJf8gICD/IyMj/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL+IiIi/yIiIu8iIiIRIiIiACIiIgEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwIzMzMAMzMzGjMz"+
                                "M/QzMzP/MzMz/jMzM/8zMzP/MzMz/zMzM/81NTb/Kikn/42Spv/X4f//yNHx/8vU9f/L1PX/y9T1"+
                                "/83W+P/I0vf/xtH2/8TO8v+pr8//oqfG/6SpyP+kqcj/pKnI/6SpyP+kqcj/pKnI/6Knxv+rstL/"+
                                "xc/0/8bR9v/H0vf/x9H2/8XP9P/G0PT/xM70/7S/7P/Bzv//hYyq/xoaF/8jJCT/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv4iIiL/IiIi7iIiIhEiIiIAIiIiAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzAjMzMwAzMzMaMzMz"+
                                "9DMzM/8zMzP+MzMz/zMzM/8zMzP/NTY2/ykpJ/9laHP/1N7//8nS8//L1PX/y9T1/8vU9f/L1PX/"+
                                "usHh/7S83v/Aye3/xtH2/8jS9//EzvP/w83y/8PN8v/DzfL/w83y/8PN8v/DzfL/xM7z/8jS+P/G"+
                                "0PX/vsjr/7O63P+4wOP/xtD1/8XP9P/G0PT/wszz/7O/7P/Bzv//XmJz/xgXFP8kJSX/IiIi/yIi"+
                                "Iv8iIiL/IiIi/iIiIv8iIiLuIiIiESIiIgAiIiIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMCMzMzADMzMxozMzP0"+
                                "MzMz/zMzM/4zMzP/MzMz/zQ0NP8wMDD/PT1A/77H5f/P2Pn/ytPz/8vU9f/L1PX/zNX2/8nR8v+i"+
                                "p8b/nKC//6Kmxf+qsND/tb3f/8DK7v/EzvL/w83y/8PN8v/DzfL/w83y/8TO8v+/yOz/tLvd/6mv"+
                                "z/+hpsX/nKC+/6Wqyv/Fz/T/xc/0/8XP9P/G0PT/vcjx/7fD8v+xvOj/MjM3/x4eHf8jIyP/IiIi"+
                                "/yIiIv8iIiL+IiIi/yIiIu4iIiIRIiIiACIiIgEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwIzMzMAMzMzGjMzM/Qz"+
                                "MzP/MzMz/jMzM/8zMzP/NTU2/ykoJv+JjqD/1uD//8jR8f/L1PX/y9T1/8vU9f/L1PX/zNX2/8HJ"+
                                "6v+vttf/pavK/5+jwv+docD/oabF/6SpyP+jqcj/pKnI/6SpyP+jqcj/pKnI/6GlxP+dob//n6TC"+
                                "/6ary/+wt9j/vsfr/8bQ9f/Fz/T/xc/0/8XP9P/G0PT/t8Lt/8DN/v+Ah6P/GRgV/yQkJf8iIiL/"+
                                "IiIi/yIiIv4iIiL/IiIi7iIiIhEiIiIAIiIiAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzAjMzMwAzMzMaMzMz9DMz"+
                                "M/8zMzP+MzMz/zQ0NP8vLy7/REVJ/8bP7v/M1ff/ytP0/8vU9f/L1PX/y9T1/8vU9f/L1PX/zdb3"+
                                "/8jS9//DzfL/u8Pm/6+22P+mq8v/o6nI/6SpyP+kqcj/pKnI/6SpyP+jqcj/pqvL/7C32P+7xOf/"+
                                "xM3y/8fS9//G0fb/xc/0/8XP9P/Fz/T/xc/0/8bQ9P/CzPP/tsLw/7bC8P85O0L/HRwb/yMjJP8i"+
                                "IiL/IiIi/iIiIv8iIiLuIiIiESIiIgAiIiIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMCMzMzADMzMxozMzP0MzMz"+
                                "/zMzM/4zMzP/NTY2/ygoJf96fo7/1t///8jR8v/L1PX/y9T1/8vU9f/L1PX/y9T1/8vU9f/K0/T/"+
                                "xc/z/8XP9f/H0ff/x9H3/8TO8v/DzPH/w83x/8PM8f/DzfH/w83x/8PM8f/EzvP/x9L3/8fR9//F"+
                                "z/X/xM7z/8XP9P/Fz/T/xc/0/8XP9P/Fz/T/xc/0/8bQ9P+4w+7/wM3//3F3j/8XFhP/JCUl/yIi"+
                                "Iv8iIiL+IiIi/yIiIu4iIiIRIiIiACIiIgEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwIzMzMAMzMzGjMzM/QzMzP/"+
                                "MzMz/jMzM/80NDT/Li4t/6etxv/S3P//ydLz/8vU9f/L1PX/y9T1/8vU9f/L1PX/y9T1/8vU9f/F"+
                                "z/T/xc/0/8XO8//FzvP/xc/0/8XQ9f/Fz/T/xM7y/8PN8v/Fz/T/x9H1/8bQ9f/EzvP/xc7z/8XP"+
                                "9P/Fz/T/xc/0/8XP9P/Fz/T/xc/0/8XP9P/Fz/T/xtD0/7/K8f+7yPj/m6XJ/yEhIP8iIiL/IiIi"+
                                "/yIiIv4iIiL/IiIi7iIiIhEiIiIAIiIiAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzAjMzMwAzMzMaMzMz9DMzM/8z"+
                                "MzP+NDQ0/zExMf86Ojv/vMTh/87Y+v/K0/T/y9T1/8vU9f/L1PX/y9T1/8vU9f/L1PX/y9T1/8XP"+
                                "9P/Fz/T/xc/0/8XP9P/Fz/T/xM7y/8TP9f/G0v//ws7+/7jD8P+5xe//ws3z/8bQ9P/Fz/T/xc/0"+
                                "/8XP9P/Fz/T/xc/0/8XP9P/Fz/T/xc/0/8XP9P/Fz/T/w83z/7nF8/+tuOP/LC0w/x8fHv8jIyP/"+
                                "IiIi/iIiIv8iIiLuIiIiESIiIgAiIiIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMCMzMzADMzMxozMzP0MzMz/zMz"+
                                "M/40NDT/MDAw/z0+QP/Byun/ztf4/8vU9P/L1PX/y9T1/8vU9f/L1PX/y9T1/8vU9f/L1PX/xtD0"+
                                "/8XP9P/Fz/T/xc/0/8TN8f/H0vz/tsLu/3h/mP96gZv/ucX0/7rG9/+zv+z/v8ry/8bQ9P/Fz/T/"+
                                "xc/0/8XP9P/Fz/T/xc/0/8XP9P/Fz/T/xc/0/8bP9P/EzvP/usb0/6y34v8sLC//IB8f/yMjI/8i"+
                                "IiL+IiIi/yIiIu4iIiIRIiIiACIiIgEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwIzMzMAMzMzGjMzM/QzMzP/MzMz"+
                                "/jQ0NP8wMDD/PT0//7/I5//M1ff/yNLz/8nS9P/J0vT/ydL0/8nS9P/J0vT/ydL0/8nS9P/EzvP/"+
                                "w83z/8PN8v/CzPH/x9P//6Kt0/9MTlb/JyYi/xgXE/9ISlX/qbPc/7/M/f+yvuz/usXw/8PN8//D"+
                                "zvP/w83z/8PN8//DzfP/w83z/8PN8//DzfP/xM7z/8LM8v+5xfP/rLfi/ywsL/8fHx//IyMj/yIi"+
                                "Iv4iIiL/IiIi7iIiIhEiIiIAIiIiAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzAjMzMwAzMzMaMzMz9DMzM/8zMzP+"+
                                "NDQ0/zExMP88PD//sbzn/7zI9/+5xfP/usb0/7rG9P+6xvT/usb0/7rG9P+6xvT/usb0/7rG9P+5"+
                                "xfP/usb1/7/M/P+Gjar/NTU2/y0tKv81NTb/JiYn/xkYFv8rKy3/ipKx/8HO//+4xPT/ucXz/7rG"+
                                "9P+5xvT/ucb0/7nG9P+5xvT/ucb0/7nG9P+6xvT/ucXz/7vI9/+vuub/LC0w/x8fHv8jIyP/IiIi"+
                                "/iIiIv8iIiLuIiIiESIiIgAiIiIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMCMzMzADMzMxozMzP0MzMz/zMzM/40"+
                                "NDT/MTEw/zs8Pv+lsNj/r7vn/6244/+tuOT/rbjk/6245P+tuOT/rbjk/6245P+tuOT/rLfi/624"+
                                "4/+st+L/Z2t9/ysqJ/8yMTH/NTU2/zIyMf8jIyP/JCQl/x8fHv8bGhj/Z2yA/6655P+st+L/rLfi"+
                                "/6y34/+st+P/rLfj/6y34/+st+P/rLfj/6y34/+st+L/r7rm/6Ou1v8rLC7/IB8f/yMjI/8iIiL+"+
                                "ISEh/yMjI+4kJCQRJCQkACMjIwEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwIzMzMAMzMzGjMzM/QzMzP/MzMz/jMz"+
                                "M/8zMzP/NDQ0/zs8Pv88PD//PDw//zw8P/88PD//PDw//zw8P/88PD//PD1A/zs7Pv8tLTD/LC0w"+
                                "/zU1N/8tLCr/NDQ0/zQ0NP8zMzP/MjIy/yMjI/8iIiH/IyMk/yIiI/8aGhf/Kios/ywtMP8sLC//"+
                                "LCwv/ywsL/8sLC//LCwv/ywsL/8sLC//LCwv/ywsL/8sLTD/Kywu/yMjI/8iIiL/IiIi/yIiIv4s"+
                                "LCz/MjIy7jIyMhEzMzMAMjIyAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzAjMzMwAzMzMaMzMz9DMzM/8zMzP+MzMz"+
                                "/zMzM/8zMzP/MTEw/zExMP8xMTD/MTEw/zExMP8xMTD/MTEw/zEwMP8xMTD/MC8v/yEhIP8eHh3/"+
                                "JiYl/zU2Nv8zMzP/MzMz/zMzM/8yMjL/IyMj/yIiIv8iIiL/IiIi/yQkJP8gIB//Hx8e/yAfH/8f"+
                                "Hx7/Hx8e/x8fHv8fHx7/Hx8e/x8fHv8fHx7/Hx8f/x8fHv8gHx//IiIi/yIiIv8hISH/Kioq/jU1"+
                                "Nf8zMzPuMzMzETMzMwAzMzMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMCMzMzADMzMxozMzP0MzMz/zMzM/4zMzP/"+
                                "MzMz/zMzM/80NDT/NDQ0/zQ0NP80NDT/NDQ0/zQ0NP80NDT/MzQ0/zQ0NP8yMzP/JCQk/yIiI/8i"+
                                "IiL/Ly8v/zQ0NP8zMzP/MzMz/zIyMv8jIyP/IiIi/yIiIv8iIiL/IiIi/yMjI/8jIyP/IyMj/yMj"+
                                "I/8jIyP/IyMj/yMjI/8jIyP/IyMj/yMjI/8jIyP/IyMj/yMjI/8iIiL/IiIi/yEhIf8vLy/+NDQ0"+
                                "/zMzM+4zMzMRMzMzADMzMwEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwIzMzMAMzMzGjMzM/QzMzP/MzMz/jMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zIyMv8jIyP/IiIi/yEh"+
                                "If8nJyf/NDQ0/zMzM/8zMzP/MjIy/yMjI/8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/y8vL/40NDT/"+
                                "MzMz7jMzMxEzMzMAMzMzAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzAjMzMwAzMzMaMzMz9DMzM/8zMzP+MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/MjIy/yQkJP8iIiL/IiIi"+
                                "/yIiIv8vLy//NDQ0/zMzM/8yMjL/IyMj/yIiIv8iIiL/IiIi/yIiIv8iIiL/IyMj/yMjI/8jIyP/"+
                                "IyMj/yMjI/8jIyP/IyMj/yMjI/8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/Ly8v/jQ0NP8z"+
                                "MzPuMzMzETMzMwAzMzMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMCMzMzADMzMxozMzP0MzMz/zMzM/4zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zQ0NP8yMjL/MTEx/zExMf8xMTH/MTEx/zExMf8wMDD/ISEh/x8fH/8hISH/"+
                                "IiIi/ycnJ/80NDT/MzMz/zExMf8jIyP/IiIi/yIiIv8iIiL/IyMj/yEhIf8gICD/ICAg/yAgIP8g"+
                                "ICD/ICAg/yAgIP8gICD/ICAg/yEhIf8jIyP/IiIi/yIiIv8iIiL/IiIi/yIiIv8vLy/+NDQ0/zMz"+
                                "M+4zMzMRMzMzADMzMwEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwIzMzMAMzMzGjMzM/QzMzP/MzMz/jMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MDAw/zc3N/87Ozv/Ozs7/zs7O/87Ozv/Ozs7/zo6Ov8tLS3/LCws/yUlJf8f"+
                                "Hx//IiIi/y8vL/80NDT/MTEx/yMjI/8iIiL/IiIi/yIiIv8eHh7/JiYm/ywsLP8sLCz/LCws/yws"+
                                "LP8sLCz/LCws/ywsLP8sLCz/JiYm/x4eHv8jIyP/IiIi/yIiIv8iIiL/IiIi/y8vL/40NDT/MzMz"+
                                "7jMzMxEzMzMAMzMzAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzAjMzMwAzMzMaMzMz9DMzM/8zMzP+MzMz/zMzM/8z"+
                                "MzP/NDQ0/zAwMP9PT0//dHR0/3R0dP90dHT/dXV1/3V1df91dXX/dXV1/3R0dP90dHT/cHBw/zo6"+
                                "Ov8dHR3/KCgo/zQ0NP8xMTH/IyMj/yIiIv8jIyP/Hh4e/z8/P/9ycnL/dHR0/3R0dP90dHT/dHR0"+
                                "/3R0dP90dHT/dHR0/3R0dP9ycnL/Pz8//x4eHv8jIyP/IiIi/yIiIv8iIiL/Ly8v/jQ0NP8zMzPu"+
                                "MzMzETMzMwAzMzMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMCMzMzADMzMxozMzP0MzMz/zMzM/4zMzP/MzMz/zQ0"+
                                "NP8xMTH/PDw8/3d3d/95eXn/d3d3/3h4eP94eHj/eHh4/3h4eP94eHj/eHh4/3d3d/98fHz/aWlp"+
                                "/yEhIf8iIiL/MDAw/zIyMv8jIyP/IiIi/yEhIf8kJCT/b29v/3t7e/93d3f/eHh4/3h4eP94eHj/"+
                                "eHh4/3h4eP94eHj/d3d3/3t7e/9zc3P/KCgo/yAgIP8iIiL/IiIi/yIiIv8vLy/+NDQ0/zMzM+4z"+
                                "MzMRMzMzADMzMwEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwIzMzMAMzMzGjMzM/QzMzP/MzMz/jMzM/8zMzP/NDQ0"+
                                "/y4uLv9cXFz/e3t7/3V1df93d3f/d3d3/3d3d/93d3f/d3d3/3d3d/92dnb/dXV1/35+fv9mZmb/"+
                                "ISEh/yEhIf8oKCj/MzMz/yMjI/8iIiL/IiIi/yMjI/9sbGz/fX19/3V1df92dnb/dnZ2/3d3d/93"+
                                "d3f/d3d3/3d3d/93d3f/dXV1/319ff9OTk7/HBwc/yMjI/8iIiL/IiIi/y8vL/40NDT/MzMz7jMz"+
                                "MxEzMzMAMzMzAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzAjMzMwAzMzMaMzMz9DMzM/8zMzP+MzMz/zQ0NP8xMTH/"+
                                "PDw8/3Z2dv93d3f/d3d3/3d3d/93d3f/d3d3/3Z2dv92dnb/eHh4/3x8fP97e3v/aWlp/zMzM/8f"+
                                "Hx//IyMj/yIiIv8rKyv/IyMj/yIiIv8jIyP/Hx8f/zg4OP9sbGz/e3t7/3x8fP94eHj/dnZ2/3Z2"+
                                "dv93d3f/d3d3/3d3d/93d3f/eHh4/3Jycv8oKCj/ICAg/yMjI/8iIiL/Ly8v/jQ0NP8zMzPuMzMz"+
                                "ETMzMwAzMzMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMCMzMzADMzMxozMzP0MzMz/zMzM/4zMzP/NDQ0/y8vL/9c"+
                                "XFz/fHx8/3Z2dv93d3f/d3d3/3Z2dv92dnb/enp6/3x8fP91dXX/W1tb/zk5Of8hISH/Hx8f/yMj"+
                                "I/8iIiL/IiIi/yEhIf8iIiL/IiIi/yIiIv8jIyP/Hh4e/yMjI/87Ozv/XFxc/3V1df99fX3/enp6"+
                                "/3Z2dv92dnb/d3d3/3d3d/92dnb/fX19/05OTv8cHBz/IyMj/yIiIv8vLy/+NDQ0/zMzM+4zMzMR"+
                                "MzMzADMzMwEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAADMzMwIzMzMAMzMzGjMzM/QzMzP/MzMz/jMzM/8yMjL/OTk5/3Nz"+
                                "c/93d3f/dnZ2/3Z2dv94eHj/e3t7/3p6ev9ra2v/UlJS/zo6Ov8gICD/HR0d/yIiIv8jIyP/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8jIyP/IiIi/x0dHf8dHR3/LS0t/0xMTP9ra2v/"+
                                "e3t7/3x8fP94eHj/dnZ2/3Z2dv94eHj/bm5u/yUlJf8hISH/IiIi/y8vL/40NDT/MzMz7jMzMxEz"+
                                "MzMAMzMzAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAMzMzAjMzMwAzMzMaMzMz9DMzM/8zMzP+MzMz/zIyMv83Nzf/c3Nz"+
                                "/3t7e/95eXn/fHx8/3R0dP9gYGD/RUVF/zMzM/8uLi7/MTEx/yYmJv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IyMj/yMjI/8fHx//HBwc/yMjI/87"+
                                "Ozv/XFxc/3V1df99fX3/eXl5/35+fv9sbGz/IyMj/yIiIv8iIiL/Ly8v/jQ0NP8zMzPuMzMzETMz"+
                                "MwAzMzMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAzMzMCMzMzADMzMxozMzP0MzMz/zMzM/4zMzP/NDQ0/zAwMP9JSUn/"+
                                "bm5u/2pqav9SUlL/Ojo6/y8vL/8vLy//MzMz/zQ0NP80NDT/JiYm/yEhIf8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yMjI/8jIyP/IiIi/x0d"+
                                "Hf8eHh7/LS0t/0xMTP9paWn/ampq/zg4OP8fHx//IyMj/yIiIv8vLy/+NDQ0/zMzM+4zMzMRMzMz"+
                                "ADMzMwEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAADMzMwIzMzMAMzMzGjMzM/QzMzP/MzMz/jMzM/8zMzP/MzMz/zAwMP80"+
                                "NDT/MzMz/y4uLv8xMTH/NDQ0/zQ0NP8zMzP/MzMz/zQ0NP8nJyf/ISEh/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IyMj"+
                                "/yMjI/8fHx//HBwc/yIiIv8iIiL/Hh4e/yMjI/8iIiL/IiIi/y8vL/40NDT/MzMz7jMzMxEzMzMA"+
                                "MzMzAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAMzMzAjMzMwAzMzMaMzMz9DMzM/8zMzP+MzMz/zMzM/8zMzP/NDQ0/zMz"+
                                "M/8zMzP/NDQ0/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/ygoKP8hISH/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yMjI/8jIyP/IiIi/yIiIv8jIyP/IiIi/yIiIv8iIiL/Ly8v/jQ0NP8zMzPuMzMzETMzMwAz"+
                                "MzMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAzMzMCMzMzADMzMxozMzP0MzMz/zMzM/4zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/Kioq/yEhIf8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8vLy/+NDQ0/zMzM+4zMzMRMzMzADMz"+
                                "MwEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAADMzMwEzMzMAMzMzGjMzM/QzMzP/MzMz/jMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQ0NP8rKyv/ISEh/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/y8vL/40NDT/MzMz7jMzMxEzMzMAMzMz"+
                                "AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAMzMzATMzMwAzMzMYMzMz8zMzM/8zMzP+MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/y0tLf8hISH/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/Ly8v/jQ0NP8zMzPuMjIyETIyMgAyMjIB"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAzMzMBMzMzADQ0NBYzMzPyMzMz/zMzM/4zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/Ly8v/yEhIf8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8vLy/+NDQ0/zMzM+4wMDAQMTExADIyMgEA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAADMzMwEzMzMAMzMzFDMzM/AzMzP/MzMz/jMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQ0NP8wMDD/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/y8vL/40NDT/MjIy7i8vLxAvLy8AMTExAQAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAMzMzATMzMwAzMzMQMzMz7TMzM/8zMzP+MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zIyMv8jIyP/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/Ly8v/jQ0NP8yMjLuLS0tEC4uLgAwMDABAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAzMzMBMzMzADMzMwszMzPmMzMz/zMzM/4zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/yUlJf8hISH/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8vLy/+NDQ0/zIyMusrKysPLCwsAC8vLwEAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAADMzMwEzMzMAMzMzBzMzM98zMzP/MzMz/TMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/Jycn/yEhIf8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/zAwMP40NDT/MjIy5yoqKgwrKysALy8vAQAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAMzMzATMzMwA0NDQCMzMz1jMzM/8zMzP9MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQ0NP8pKSn/ISEh/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8jIyP/MTEx/TQ0NP8yMjLaIiIiBSYmJgAvLy8BAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAzMzMANDQ0ATMzMwAzMzPIMzMz/zMzM/wzMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/ywsLP8hISH/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yQkJP8yMjL8MzMz/zMzM8I0NDQANTU1AjExMQAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAADIyMgAzMzMCMzMzADMzM7szMzP/MzMz/DMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/Li4u/yEhIf8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8hISH/JiYm/zQ0NPwzMzP/MjIyvDU1NQA2NjYCLy8vAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAMzMzADMzMwMzMzMAMzMzqjMzM/8zMzP8MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8xMTH/IyMj/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yEhIf8qKir/NDQ0/DMzM/8xMTG0NjY2ADY2NgMuLi4AAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAzMzMAMzMzBDMzMwAzMzOUMzMz/zMzM/szMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8lJSX/ISEh/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/ISEh/y4uLv80NDT7MzMz/zIyMpA0NDQANDQ0BCwsLAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "ADU1NQAzMzMEMzMzADMzM30zMzP/MzMz+zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/ycnJ/8hISH/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8jIyP/MjIy/zMzM/szMzP/MjIyfzIyMgAyMjIEAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAADMzMwQzMzMAMzMzZzMzM/8zMzP7MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/Kysr/yEhIf8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/ISEh/ycnJ/80NDT/MzMz+zMzM/8xMTFvMjIyADIyMgQtLS0AAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAz"+
                                "MzMAMzMzAzMzMwAzMzNNMzMz/zMzM/wzMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQ0NP8uLi7/ISEh/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8hISH/LS0t/zQ0NP8zMzP8MzMz/zIyMkcyMjIAMjIyAy0tLQAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAzMzMDMzMzADMzMzYzMzP/MzMz/jMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zExMf8jIyP/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/ISEh/yQkJP8zMzP/MzMz/zMzM/0zMzP/Ly8vPDAwMAAwMDADAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "ADMzMwIzMzMAMzMzIDMzM/czMzP/MzMz/jMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/yUlJf8hISH/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8hISH/LCws/zQ0NP8zMzP+MzMz/zMzM/YwMDAeMDAwADExMQIAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "MzMzATMzMwAzMzMOMzMz6TMzM/8zMzP+MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/KSkp/yEhIf8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/ISEh"+
                                "/yQkJP8zMzP/MzMz/zMzM/4zMzP/MjIy7S0tLRAtLS0AMDAwAQAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAz"+
                                "MzMBMTExACgoKAAzMzPSMzMz/zMzM/0zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQ0NP8tLS3/ISEh/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8hISH/"+
                                "LS0t/zQ0NP8zMzP/MzMz/TMzM/8yMjLTAAAAARcXFwAuLi4BAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADIy"+
                                "MgAzMzMCMzMzADMzM7szMzP/MzMz/DMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/zExMf8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/ISEh/ycnJ/80"+
                                "NDT/MzMz/zMzM/8zMzP8MzMz/zIyMr01NTUANTU1AjAwMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMz"+
                                "ADMzMwMzMzMAMzMznjMzM/8zMzP7MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/yUlJf8hISH/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8jIyP/MjIy/zMz"+
                                "M/8zMzP/MzMz/zMzM/szMzP/MjIyoTU1NQA1NTUDLS0tAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAvLy8A"+
                                "MzMzBDMzMwAzMzOBMzMz/zMzM/szMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/Kioq/yEhIf8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/ISEh/y4uLv80NDT/MzMz"+
                                "/zMzM/8zMzP/MzMz+zMzM/8yMjJ/MjIyADIyMgQnJycAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAz"+
                                "MzMEMzMzADMzM2UzMzP/MzMz+zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8zMzP/MzMz/zQ0NP8uLi7/ISEh/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yEhIf8oKCj/NDQ0/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP7MzMz/zExMWkyMjIAMjIyBDY2NgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMTExADMz"+
                                "MwMzMzMAMzMzRzMzM/8zMzP9MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zIyMv8kJCT/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/zAwMP80NDT/MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/0zMzP/MTExQjIyMgAyMjIDKSkpAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMz"+
                                "AjMzMwAzMzMvMzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/4zMzP/MzMz/zMzM/8zMzP/"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/8zMzP/NDQ0/ygoKP8hISH/IiIi/yIiIv8iIiL/IiIi/yIiIv8i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/yEhIf8lJSX/MzMz/jMzM/8zMzP/MzMz/zMz"+
                                "M/8zMzP/MzMz/zMzM/8wMDAzMDAwADAwMAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMB"+
                                "MzMzADMzMxczMzPyMzMz/zMzM/4zMzP/MzMz/zMzM/8zMzP+MzMz/jMzM/wzMzP9MzMz/zMzM/8z"+
                                "MzP/MzMz/zMzM/8zMzP/MzMz/zMzM/80NDT/LS0t/yEhIf8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "Iv8iIiL/IiIi/yIiIv8iIiL/IiIi/yIiIv8iIiL/ISEh/ikpKfs0NDT+MzMz/zMzM/8zMzP/MzMz"+
                                "/zMzM/4zMzP/MzMz8DAwMBMwMDAAMTExAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwEz"+
                                "MzMAMzMzCDMzM98zMzP/MzMz/TMzM/8zMzP/MzMz/zMzM/szMzPuMzMz/zMzM/8zMzP8MzMz/DMz"+
                                "M/4zMzP/MzMz/zMzM/8zMzP/MzMz/zMzM/8yMjL/IyMj/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi"+
                                "/yIiIv8iIiL/IiIi/yIiIv8iIiL/IiIi/CIiIvwhISH/Kysr/zQ0NPYzMzP9MzMz/zMzM/8zMzP/"+
                                "MzMz/TMzM/8yMjLkKioqCysrKwAvLy8BAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzADMz"+
                                "MwEzMzMAMzMzxzMzM/8zMzP8MzMz/zMzM/0zMzP/MzMz2zMzMxkzMzN3MzMz5zMzM/8zMzP+MzMz"+
                                "/zMzM/wzMzP7MzMz/TMzM/4zMzP/MzMz/zQ0NP8nJyf/ISEh/yIiIv8iIiL/IiIi/yIiIv8iIiL/"+
                                "IiIi/iIiIv0iIiL7IiIi+yIiIv4iIiL+IiIi/yIiIu4qKiqDMzMzLzMzM+kzMzP/MzMz/jMzM/8z"+
                                "MzP8MzMz/zMzM8M1NTUANjY2AjAwMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMAMzMz"+
                                "AzMzMwAzMzOtMzMz/zMzM/wzMzP/MzMz+zMzM/8zMzN8MzMzADQ0NAIyMjINMzMzXjMzM74zMzP3"+
                                "MzMz/zMzM/8zMzP/MzMz/zMzM/4zMzP8NDQ0/C0tLfshISH7IiIi+yIiIvsiIiL7IiIi/CIiIv0i"+
                                "IiL/IiIi/yIiIv8iIiL/IiIi+yMjI8ckJCRpJycnE0dHRwE0NDQAMjIylTMzM/8zMzP7MzMz/zMz"+
                                "M/wzMzP/MjIytDU1NQA2NjYDLy8vAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADQ0NAAzMzME"+
                                "MzMzADMzM44zMzP/MzMz+zMzM/4zMzP/MzMz8DMzMx4zMzMAMzMzBTMzMwE0NDQANDQ0ADMzMx4z"+
                                "MzNfMzMznzMzM9AzMzPxMzMz/zMzM/8zMzP/MjIy/yQkJP8iIiL/IiIi/yIiIv8iIiL/IiIi/yIi"+
                                "IvYjIyPZIyMjqSQkJGolJSUoQUFBAf///wASEhIALi4uBjIyMgAxMTEyMzMz/jMzM/8zMzP/MzMz"+
                                "+zMzM/8yMjKKMzMzADMzMwQtLS0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALi4uADMzMwQz"+
                                "MzMAMzMzcjMzM/8zMzP7MzMz+zMzM/8zMzObMzMzADMzMwMzMzMAMzMzATMzMwQzMzMCMzMzADMz"+
                                "MwAzMzMAMzMzATMzMxUzMzMzMzMzTTMzM2M0NDRxJycnfCIiIn8kJCR8JCQkciQkJFUlJSU7JiYm"+
                                "HTQ0NAQnJycAJSUlACEhIQAeHh4CIyMjBCYmJgE0NDQANjY2Ajc3NwAyMjK2MzMz/zMzM/wzMzP7"+
                                "MzMz/zExMXkyMjIAMjIyBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwMDAAMzMzAzMz"+
                                "MwAzMzNTMzMz/zMzM/wzMzP/MzMz/zMzMzczMzMAMzMzAjMzMwAzMzMAMzMzADMzMwAzMzMCMzMz"+
                                "BDMzMwQyMjIBMjIyADIyMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0dHQAbGxsA"+
                                "GhoaACAgIAMjIyMEJSUlAigoKAAoKCgAJSUlADMzMwAyMjIDMjIyADIyMlAzMzP/MzMz/TMzM/wz"+
                                "MzP/MTExUDIyMgAyMjIDLS0tAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADg4OAAzMzMDMzMz"+
                                "ADMzMzkzMzP/MzMz+zMzM/8zMzO5MjIyADIyMgE0NDQAMzMzAAAAAAAAAAAANTU1ADMzMwAxMTEA"+
                                "NTU1ADMzMwAzMzMBMzMzAjMzMwMzMzMENDQ0BCYmJgQiIiIEIyMjBCMjIwQjIyMDJCQkAyUlJQIn"+
                                "JycBKioqACEhIQAnJycAJycnAAAAAAAAAAAAMDAwADExMQEoKCgAKSkpBTMzM9QzMzP/MzMz+zMz"+
                                "M/8wMDA+MDAwADAwMAMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMzMwIzMzMA"+
                                "MzMzITMzM/YzMzP9MzMz/zMzM1IzMzMAMzMzAzQ0NAAxMTEAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAxMTEAMDAwADMzMwQzMzMAMjIycjMzM/8zMzP9MzMz"+
                                "9jAwMCAwMDAAMTExAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzATMzMwAz"+
                                "MzMNMzMz5jMzM/8zMzPUMjIyBjExMQAzMzMBMzMzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAxMTEAMTExATAwMAAwMDAYMzMz6jMzM/8yMjLr"+
                                "LCwsDy0tLQAvLy8BAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAyMjIANDQ0AjQ0"+
                                "NAAzMzOMMzMz+TMzM1gzMzMAMzMzAzMzMwAyMjIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADExMQAyMjIAMzMzAzMzMwAyMjKAMzMz/zIyMp43"+
                                "NzcAODg4Ai8vLwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADExMQA1NTUANTU1"+
                                "ADQ0NAIzMzMKMzMzATQ0NAE0NDQANDQ0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADIyMgAzMzMANTU1ADMzMwQzMzMfMTExBjIy"+
                                "MgAyMjIAMTExAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMzMzADMzMwAzMzMA"+
                                "MzMzAjMzMwAzMzMCMzMzADMzMwAxMTEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMTExADAwMAAwMDAAMjIyAjAwMAAyMjIBMDAw"+
                                "ADAwMAAwMDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAyMjIANDQ0ADQ0NAA0"+
                                "NDQAMzMzATMzMwAzMzMAMzMzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzMzMAMzMzADMzMwAzMzMAMzMzAjIyMgAyMjIA"+
                                "MzMzAC8vLwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////////////"+
                                "////////////////////////////////////////////////////////////////////////////"+
                                "//////AAAA///////////////+AAL/QAB/////////////gCfkACfkAf//////////8AtAAAAAAt"+
                                "AP/////////gEgAAAAAAAEgH///////+AkAAAAAAAAACQH//////9AQAAAAAAAAAACgv/////6FA"+
                                "AAAAAAAAAAAChf////0KAAAAAAAAAAAAAFC////oIAAAAAAAAAAAAAAGF///IwAAAAAAAAAAAAAA"+
                                "AET//QQAAAAAAAAAAAAAAAAgv/QgAAAAAAAAAAAAAAAABC/ogAAAAAAAAAAAAAAAAAEX0AAAAAAA"+
                                "AAAAAAAAAAAAC8gAAAAAAAAAAAAAAAAAABPQAAAAAAAAAAAAAAAAAAAL0AAAAAAAAAAAAAAAAAAA"+
                                "C8gAAAAAAAAAAAAAAAAAABPIAAAAAAAAAAAAAAAAAAATyAAAAAAAAAAAAAAAAAAAE+gAAAAAAAAA"+
                                "AAAAAAAAABfoAAAAAAAAAAAAAAAAAAAX5AAAAAAAAAAAAAAAAAAAJ+QAAAAAAAAAAAAAAAAAACfk"+
                                "AAAAAAAAAAAAAAAAAAAn8gAAAAAAAAAAAAAAAAAAT/EAAAAAAAAAAAAAAAAAAI/9AAAAAAAAAAAA"+
                                "AAAAAACf+oAAAAAAAAAAAAAAAAABX/1AAAAAAAAAAAAAAAAAAr/+oAAAAAAAAAAAAAAAAAV//kAA"+
                                "AAAAAAAAAAAAAAACf/+kAAAAAAAAAAAAAAAAJf//0QAAAAAAAAAAAAAAAIv//+RAAAAAAAAAAAAA"+
                                "AAQn///9CgAAAAAAAAAAAAAQv////6CAAAAAAAAAAAABBf/////0IAAAAAAAAAAABC///////pAA"+
                                "AAAAAAAAABF///////8kAAAAAAAAAAAk////////0QAAAAAAAAAAi/////////SAAAAAAAAAAS//"+
                                "///////6IAAAAAAAAATf/////////ogAAAAAAAARf/////////8kAAAAAAAAJP//////////0gAA"+
                                "AAAAAEv///////////IAAAAAAABP///////////6AAAAAAAAX///////////+gAAAAAAAF//////"+
                                "//////oAAAAAAABf///////////6AAAAAAAAX///////////+gAAAAAAAF////////////oAAAAA"+
                                "AABf///////////6AAAAAAAAX///////////+gAAAAAAAF////////////oAAAAAAABf////////"+
                                "///6AAAAAAAAX///////////+gAAAAAAAF////////////oAAAAAAABf///////////6AAAAAAAA"+
                                "X///////////+gAAAAAAAF////////////oAAAAAAABf///////////6AAAAAAAAX///////////"+
                                "+gAAAAAAAF////////////oAAAAAAABf///////////6AAAAAAAAX///////////+gAAAAAAAF//"+
                                "//////////oAAAAAAABf///////////6AAAAAAAAX///////////+gAAAAAAAF////////////oA"+
                                "AAAAAABf///////////6AAAAAAAAX///////////+gAAAAAAAF////////////oAAAAAAABf////"+
                                "///////6AAAAAAAAX///////////+gAAAAAAAF////////////oAAAAAAABf///////////6AAAA"+
                                "AAAAX///////////+gAAAAAAAF////////////oAAAAAAABf///////////6AAAAAAAAX///////"+
                                "////+gAAAAAAAF////////////oAAAAAAABf///////////6AAAAAAAAX///////////+gAAAAAA"+
                                "AF////////////oAAAAAAABf///////////5AAAAAAAAn///////////+QAAAAAAAJ//////////"+
                                "//kAAAAAAACf///////////5AAAAAAAAn///////////+QAAAAAAAL////////////0AAAAAAAC/"+
                                "///////////9AAAAAAAAv////////////QAAAAAAAL////////////0AAAAAAAC////////////9"+
                                "AAAAAAAAv////////////QAAAAAAAL////////////yAAAAAAAE////////////8gAAAAAABP///"+
                                "/////////IAAAAAAAX////////////6AAAAAAAF////////////+gAAAAAABf////////////oAA"+
                                "AAAAAX////////////6AAAAAAAF////////////+gAAAAAABf////////////kAAAAAAAn//////"+
                                "//////5AQAAAAgJ////////////+QEQAABICf////////////0CCgAFBAv////////////9AiC/0"+
                                "EQL/////////////QR4AAHkC/////////////0E////8gv////////////9BP////IL/////////"+
                                "////In////5E/////////////yF////+Rf////////////9C/////pL/////////////ov////9F"+
                                "////////////////////////////////////////////////////////////////////////////"+
                                "//////////////////////////////////////////////////////////8=")),0,$$.Length)))))
#endregion
$Tool.add_Load({ToolLoad($Tool)})

#endregion

#region Custom Code
#importing active directory module for AD group checks
Import-Module -Name ActiveDirectory

     # Site configuration
                $SiteCode = $SiteCode # Site code 
                $ProviderMachineName = $siteserver # SMS Provider machine name

                # Customizations
                $initParams = @{}
                #$initParams.Add("Verbose", $true) # Uncomment this line to enable verbose logging
                #$initParams.Add("ErrorAction", "Stop") # Uncomment this line to stop the script on any errors

                # Do not change anything below this line

                # Import the ConfigurationManager.psd1 module 
                if((Get-Module ConfigurationManager) -eq $null) {
                    Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1" @initParams 
                }

                # Connect to the site's drive if it is not already present
                if((Get-PSDrive -Name $SiteCode -PSProvider CMSite -ErrorAction SilentlyContinue) -eq $null) {
                    New-PSDrive -Name $SiteCode -PSProvider CMSite -Root $ProviderMachineName @initParams
                }

                # Set the current location to be the site code.
                Set-Location "$($SiteCode):\" @initParams

                 # email function below 

                        Function Send-Mail
                        {
                            Param (
                                [Parameter(Mandatory=$False, 
                                           ValueFromPipeline=$true,
                                           ValueFromPipelineByPropertyName=$true, 
                                           Position=0,
                                           ParameterSetName='Parameter Set 1')]
                                [ValidateNotNullOrEmpty()] 
                                [string[]]$To,

                                [Parameter(Mandatory=$False,
                                           Position=1,
                                           ParameterSetName='Parameter Set 1')]
                                           [Alias("Copy")]
                                [string[]]$CC,
                                [Parameter(Mandatory=$False,
                                           Position=1,
                                           ParameterSetName='Parameter Set 1')]
                                           [Alias("Black")]
                                [string[]]$BCC,
                                [Parameter(Mandatory=$false,
                                           Position=2,
                                           ParameterSetName='Parameter Set 1')]
                                $From = "$($env:username)@domain.com" ,
                                $subject = "Mail triggered from Script",
                                $body,
                                $Attachment,
                                [Alias("HTML")]
                                [Switch]$AsHtml,

                                $SMTPServer = $SMTP
                            )

                            Begin
                            {
                                $MailMessage = New-Object System.Net.Mail.MailMessage 
		                        $SMTPClient = New-Object System.Net.Mail.smtpClient

                                $MailMessage.Sender = $From
		                        $MailMessage.From = $From

                                Function Check-Format
                                {
                                    Param ($Data)
            
                                    If ($Data -contains ",")
                                    {
                                        $Data = $Data.Split(",")
                                    }
                                    ElseIf ($Data -contains ";")
                                    {
                                        $Data = $Data.Split(";")
                                    }

                                    Return $Data
                                }
                            }

                            Process
                            {

                                $SMTPClient.host = $SMTPServer
		        
                                If ($subject)
                                {
		                            $MailMessage.Subject = $subject
                                }

		                        If ($Attachment)
                                {
                                    Foreach ($File in $Attachment)
                                    {
                                        $MailMessage.Attachments.Add($File)
                                    }
                                }

                                If ($To)
                                {
                                    $To = Check-Format -Data $To
		                            $To | % {$MailMessage.To.add($_)}
                                }	
                                If ($CC)
                                {
                                    $CC = Check-Format -Data $CC
                                    $CC | % {$MailMessage.CC.add($_)}
                                }
                                If ($Bcc)
                                {
                                    $BCC = Check-Format -Data $BCC
		                            $BCC | % {  $MailMessage.BCC.add($_)}
                                }
		
                                If ($Body)
                                {
                                    $MailMessage.Body = $body
		                        }
        
                                If ($AsHtml)
                                {
                                    $MailMessage.IsBodyHtml = $true
		                        }
                            }

                            End
                            {
                                $SMTPClient.Send($MailMessage)
                            }
                        }
#endregion

#region Event Loop

function Main{
[System.Windows.Forms.Application]::EnableVisualStyles()
[System.Windows.Forms.Application]::Run($Tool)
}

#endregion

#endregion

#region Event Handlers

function ComboBox3SelectedIndexChanged( $object ){}

function ComboBoxtechSelectedIndexChanged( $object ){
    if($ComboBoxtech.SelectedItem -eq "Application"){
    $Labelappname.Text = "Application Name"
    $TextBoxappname.Size = New-Object System.Drawing.Size(352, 19)
    $Tool.Controls.Remove($ComboBoxprogram)
    
    }elseif($ComboBoxtech.SelectedItem -eq "Package"){
    
    $Labelappname.Text = "Package ID"
    $TextBoxappname.Size = New-Object System.Drawing.Size(224, 19)
    $Tool.Controls.Add($ComboBoxprogram) 
        
    }


}

function ComboBox1SelectedIndexChanged( $object ){}

function ButtondeployClick( $object ){

    if($ComboBoxtech.SelectedItem -eq "Application")
{
   $log.AppendText("Application technology selected") 
                              
 $AdgroupName = $TextBoxadgroup.Text
 $ApplicationName = $TextBoxappname.Text

 $log.AppendText("`nGiven ADgroup name $($TextBoxadgroup.Text)")
 $log.AppendText("`nGiven Application name $($TextBoxappname.Text)")

$ADGROUP = Get-ADGroup $AdgroupName -Properties * -Server bell.corp.bce.ca   #change server name, if required -server parameter
               
if ($ADGROUP.Name -eq $AdgroupName)
{
$log.AppendText("`r`n ADgroup Found in AD")
if($CheckBoxifuser.CheckState -eq "Checked")
{
        $log.AppendText("`nGoing for user collection")        
    $existingcol = Get-CMUserCollection -Name $ADGROUP.Name
    If ($existingcol)
         {

         $log.Appendtext("`nUser collection Exist, creating deployment with this collection, Please take care of any other deployments to this existing collection")
        $Global:app = Get-CMApplication -Name $ApplicationName
                                                                                                                                                                                                                    
        $Global:Naming = ($ADGROUP.Name).Substring(($ADGROUP.Name).Length -3)
        switch($naming)
            {
            BEL { Move-CMObject -FolderPath "BEL:\UserCollection\Bell" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Application\Bell\Application  Deployment\Production' -InputObject $app }

            BELL { Move-CMObject -FolderPath "BEL:\UserCollection\Bell" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Application\Bell\Application  Deployment\Production' -InputObject $app }

            ALL { Move-CMObject -FolderPath "BEL:\UserCollection\Common\Available" -InputObject $existingcol 
                    Move-CMObject -FolderPath 'BEL:\Application\Common Apps' -InputObject $app}

            ATL { Move-CMObject -FolderPath "BEL:\UserCollection\Aliant\Software Deployment  Collections\Software Deployment Collections DESKTOP EVOLUTION\AD Security Group Software Deployments (User based)" -InputObject $existingcol 
                        Move-CMObject -FolderPath 'BEL:\Application\Aliant\Application' -InputObject $app}

            MED { Move-CMObject -FolderPath "BEL:\UserCollection\Media\Software Publishing" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Application\Media\Media Business Apps' -InputObject $app }

            MTS { Move-CMObject -FolderPath "BEL:\UserCollection\MTS" -InputObject $existingcol
                        Move-CMObject -FolderPath 'BEL:\Application\MTS\Application Deployment\Production' -InputObject $app }

            default {Move-CMObject -FolderPath "BEL:\UserCollection\Common\Available" -InputObject $existingcol
                Move-CMObject -FolderPath 'BEL:\Application\Common Apps' -InputObject $app}
            }

if ($app)
                {
                $log.AppendText("`nApplication found in SCCM $($app.LocalizedDisplayName)")
                $log.AppendText("`nSetting Task Sequence Autoinstall")                                                                                                                                                                                                                                 
                Get-CMApplication $app.LocalizedDisplayName | Set-CMApplication -AutoInstall $true  -ErrorAction SilentlyContinue
                $log.AppendText("`nCreating New deployment")                                                                                                                                                                                                                                 
                $deployment = New-CMApplicationDeployment -Name $($app.LocalizedDisplayName) -CollectionId $($existingcol.CollectionID) `
                -DeployPurpose Available -DeployAction Install -UserNotification DisplaySoftwareCenterOnly -TimeBaseOn LocalTime -PersistOnWriteFilterDevice $False -AvailableDateTime (Get-Date).AddMinutes(30)                                                                                                                                                                                                                                           
                $log.AppendText("`nNew deployment Created, assignment ID is $($deployment.AssignmentID)")


 $obj = @"
  <h5>Hi Team,</h5>
<h5>AD group Deployment is created </h5>
<h3> SCCM Application Deployment summary Below</h3>
<table Border="2" >

	<tr>
		<th>CRQ or WO or REQ </th>
		<td>$($TextBoxcrq.Text)</td>
	</tr>
	<tr>
		<th>Application Name</th>
		<td>$($deployment.ApplicationName)</td>
	</tr>
    <tr>
		<th>Collection name</th>
		<td>$($deployment.CollectionName)</td>    
	</tr>
    <tr>
		<th>Collection ID</th>
		<td>$($deployment.TargetCollectionID)</td>    
    </tr>
    <tr>
		<th>Deploy Intent</th>
		<td>Available</td>    
    </tr>
    <tr>
		<th>AvailableTime</th>
		<td>$($deployment.StartTime)</td>    
    </tr>
        <tr>
		<th>App Deployment Id</th>
		<td>$($deployment.AssignmentID)</td>    
	</tr>

</table>


<p>Thanks,</p>
<p>$($env:USERNAME)</p>
<p>$($env:COMPUTERNAME)</p>
                                                            
"@

Send-Mail -To $($ComboBoxemail.SelectedItem) -CC $CCAddress -subject "AD Group Deployment Summary - $($deployment.ApplicationName)" -body $obj -From "MECM_Automation@bell.com" -AsHtml

   }else{$log.AppendText("`ncheck the application name")} 


                }else{
                $log.Appendtext("`nCreating collection")

                 $Schedule = New-CMSchedule -start "01/01/2021 12:00 AM" -DurationInterval Minutes -DurationCount 0 -IsUtc:$False -Nonrecurring                                                                                                                                                                                                
                 $query = "select SMS_R_USER.ResourceID,SMS_R_USER.ResourceType,SMS_R_USER.Name,SMS_R_USER.UniqueUserName,SMS_R_USER.WindowsNTDomain from SMS_R_User where SMS_R_User.UserGroupName = 'Bell\\$($Adgroup.Name)'"
                 $NewCollection = New-CMUserCollection -Name $Adgroup.Name -LimitingCollectionId 'SMS00002' -RefreshType None -RefreshSchedule $Schedule
                 $log.AppendText("`nNew collection created $($newcollection.CollectionID)")

                Add-CMUserCollectionQueryMembershipRule -CollectionName $Adgroup.Name -QueryExpression $query -RuleName $Adgroup.Name | Out-Null
                $log.AppendText("`nadding query")
                $log.AppendText("`n $query")
                $Global:app = Get-CMApplication -Name $ApplicationName
                                                                                                                                                                                                                               
                $Global:Naming = ($ADGROUP.Name).Substring(($ADGROUP.Name).Length -3)
                switch($naming)
                        {
                        BEL { Move-CMObject -FolderPath "BEL:\UserCollection\Bell" -InputObject $NewCollection
                                Move-CMObject -FolderPath 'BEL:\Application\Bell\Application  Deployment\Production' -InputObject $app }

                        BELL { Move-CMObject -FolderPath "BEL:\UserCollection\Bell" -InputObject $NewCollection
                                Move-CMObject -FolderPath 'BEL:\Application\Bell\Application  Deployment\Production' -InputObject $app }

                        ALL { Move-CMObject -FolderPath "BEL:\UserCollection\Common\Available" -InputObject $NewCollection 
                                Move-CMObject -FolderPath 'BEL:\Application\Common Apps' -InputObject $app}

                        ATL { Move-CMObject -FolderPath "BEL:\UserCollection\Aliant\Software Deployment  Collections\Software Deployment Collections DESKTOP EVOLUTION\AD Security Group Software Deployments (User based)" -InputObject $NewCollection 
                                    Move-CMObject -FolderPath 'BEL:\Application\Aliant\Application' -InputObject $app}

                        MED { Move-CMObject -FolderPath "BEL:\UserCollection\Media\Software Publishing" -InputObject $NewCollection
                                Move-CMObject -FolderPath 'BEL:\Application\Media\Media Business Apps' -InputObject $app }

                        MTS { Move-CMObject -FolderPath "BEL:\UserCollection\MTS" -InputObject $NewCollection
                                    Move-CMObject -FolderPath 'BEL:\Application\MTS\Application Deployment\Production' -InputObject $app }

                        default {Move-CMObject -FolderPath "BEL:\UserCollection\Common\Available" -InputObject $NewCollection
                            Move-CMObject -FolderPath 'BEL:\Application\Common Apps' -InputObject $app}
                        }

                if ($app)
                {
                $log.AppendText("`nApplication found in SCCM $($app.LocalizedDisplayName)")
                                                                                                                                                                                                                                                
                Get-CMApplication $app.LocalizedDisplayName | set-CMApplication -AutoInstall $true
                                                                                                                                                                                                                                                
                $deployment = New-CMApplicationDeployment -Name $($app.LocalizedDisplayName) -CollectionId $($newcollection.CollectionID) `
                -DeployPurpose Available -DeployAction Install -UserNotification DisplaySoftwareCenterOnly -TimeBaseOn LocalTime -PersistOnWriteFilterDevice $False -AvailableDateTime (Get-Date).AddMinutes(30)                                                                                                                                                                                                                                           
               $log.AppendText("`nNew deployment assignment ID is $($deployment.AssignmentID)")


 $obj = @"
  <h5>Hi Team,</h5>
<h5>AD group Deployment is created </h5>
<h3> SCCM Application Deployment summary Below</h3>
<table Border="2" >

	<tr>
		<th>CRQ or WO or REQ </th>
		<td>$($TextBoxcrq.Text)</td>
	</tr>
	<tr>
		<th>Application Name</th>
		<td>$($deployment.ApplicationName)</td>
	</tr>
    <tr>
		<th>Collection name</th>
		<td>$($deployment.CollectionName)</td>    
	</tr>
    <tr>
		<th>Collection ID</th>
		<td>$($deployment.TargetCollectionID)</td>    
    </tr>
    <tr>
		<th>Deploy Intent</th>
		<td>Available</td>    
    </tr>
    <tr>
		<th>AvailableTime</th>
		<td>$($deployment.StartTime)</td>    
    </tr>
        <tr>
		<th>App Deployment Id</th>
		<td>$($deployment.AssignmentID)</td>    
	</tr>

</table>


<p>Thanks,</p>
<p>$($env:USERNAME)</p>
<p>$($env:COMPUTERNAME)</p>
                                                            
"@

Send-Mail -To $($ComboBoxemail.SelectedItem) -CC $CCAddress -subject "AD Group Deployment Summary - $($deployment.ApplicationName)" -body $obj -From "MECM_Automation@bell.com" -AsHtml

   }else{$log.AppendText("`ncheck the application name")}               
               
              
              
              
}
      
                }elseif($CheckBoxifuser.CheckState -eq "Unchecked"){
                $existingcol = Get-CMDeviceCollection -Name $ADGROUP.Name 
                If ($existingcol)
                {
                $log.Appendtext("`ncollection Exist, creating deployment with this collection, Please take care of any other deployments to this existing collection and its variable")
                
                $Global:app = Get-CMApplication -Name $ApplicationName
                Remove-CMDeviceCollectionVariable -CollectionName $existingcol.Name -VariableName $Adgroup.Name -Force
                New-CMDeviceCollectionVariable -CollectionName $existingcol.Name -VariableName $Adgroup.Name -Value $App.LocalizedDisplayName -IsMask $False | Out-Null
                $log.AppendText("`nAdding Collection Variable")          
                                                                                                                                                                                                               
            $Global:Naming = ($ADGROUP.Name).Substring(($ADGROUP.Name).Length -3)
            switch($naming)
            {
            BEL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Bell\Software Deployment\Available" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Application\Bell\Application  Deployment\Production' -InputObject $app }

            BELL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Bell\Software Deployment\Available" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Application\Bell\Application  Deployment\Production' -InputObject $app }

            ALL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Common\Software Deployment\Available" -InputObject $existingcol 
                    Move-CMObject -FolderPath 'BEL:\Application\Common Apps' -InputObject $app}

            ATL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Aliant\Software Deployment\Available" -InputObject $existingcol 
                        Move-CMObject -FolderPath 'BEL:\Application\Aliant\Application' -InputObject $app}

            MED { Move-CMObject -FolderPath "BEL:\DeviceCollection\Media\Software Deployment\AD-Based Groups\Available" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Application\Media\Media Business Apps' -InputObject $app }

            MTS { Move-CMObject -FolderPath "BEL:\DeviceCollection\MTS\Software Deployment\Available" -InputObject $existingcol
                        Move-CMObject -FolderPath 'BEL:\Application\MTS\Application Deployment\Production' -InputObject $app }

            default { }
            }

if ($app)
                {
                $log.AppendText("`nApplication found in SCCM $($app.LocalizedDisplayName)")
                                                                                                                                                                                                                                                
                Get-CMApplication $app.LocalizedDisplayName | set-CMApplication -AutoInstall $true
                                                                                                                                                                                                                                                
                $deployment = New-CMApplicationDeployment -Name $app.LocalizedDisplayName -CollectionId $existingcol.CollectionID `
                -DeployPurpose Available -DeployAction Install -UserNotification DisplaySoftwareCenterOnly -TimeBaseOn LocalTime -PersistOnWriteFilterDevice $False -AvailableDateTime (Get-Date).AddMinutes(30)                                                                                                                                                                                                                                           
               $log.AppendText("`nNew deployment assignment ID is $($deployment.AssignmentID)")


 $obj = @"
  <h5>Hi Team,</h5>
<h5>AD group Deployment is created </h5>
<h3> SCCM Application Deployment summary Below</h3>
<table Border="2" >

	<tr>
		<th>CRQ or WO or REQ </th>
		<td>$($TextBoxcrq.Text)</td>
	</tr>
	<tr>
		<th>Application Name</th>
		<td>$($deployment.ApplicationName)</td>
	</tr>
    <tr>
		<th>Collection name</th>
		<td>$($deployment.CollectionName)</td>    
	</tr>
    <tr>
		<th>Collection ID</th>
		<td>$($deployment.TargetCollectionID)</td>    
    </tr>
    <tr>
		<th>Deploy Intent</th>
		<td>Available</td>    
    </tr>
    <tr>
		<th>AvailableTime</th>
		<td>$($deployment.StartTime)</td>    
    </tr>
        <tr>
		<th>App Deployment Id</th>
		<td>$($deployment.AssignmentID)</td>    
	</tr>

</table>


<p>Thanks,</p>
<p>$($env:USERNAME)</p>
<p>$($env:COMPUTERNAME)</p>
                                                            
"@

Send-Mail -To $($ComboBoxemail.SelectedItem) -CC $CCAddress -subject "AD Group Deployment Summary - $($deployment.ApplicationName)" -body $obj -From "MECM_Automation@bell.com" -AsHtml

   }else{$log.AppendText("`ncheck the application name")} 


                }else{
                $log.Appendtext("`nCreating collection")

                 $Schedule = New-CMSchedule -start "01/01/2021 12:00 AM" -DurationInterval Minutes -DurationCount 0 -IsUtc:$False -Nonrecurring                                                                                                                                                                                                
                 $query = "select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System where SMS_R_System.SystemGroupName = 'Bell\\$($Adgroup.Name)'"
                 $NewCollection = New-CMDeviceCollection -Name $Adgroup.Name -LimitingCollectionId 'SMS00001' -RefreshType None -RefreshSchedule $Schedule
                 $log.AppendText("`nNew collection created $($newcollection.CollectionID)")

                Add-CMDeviceCollectionQueryMembershipRule -CollectionName $Adgroup.Name -QueryExpression $query -RuleName $Adgroup.Name | Out-Null
                $log.AppendText("`nadding query")
                $log.AppendText("`n $query")

                $Global:app = Get-CMApplication -Name $ApplicationName
               
                New-CMDeviceCollectionVariable -CollectionName $Adgroup.Name -VariableName $Adgroup.Name -Value $App.LocalizedDisplayName -IsMask $False | Out-Null
                $log.AppendText("`nAdding Collection Variable")          
                                                                                                                                                                                                               
                $Global:Naming = ($ADGROUP.Name).Substring(($ADGROUP.Name).Length -3)
                switch($naming)
                        {
                                    BEL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Bell\Software Deployment\Available" -InputObject $NewCollection
                                            Move-CMObject -FolderPath 'BEL:\Application\Bell\Application  Deployment\Production' -InputObject $app }

                                    BELL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Bell\Software Deployment\Available" -InputObject $NewCollection
                                            Move-CMObject -FolderPath 'BEL:\Application\Bell\Application  Deployment\Production' -InputObject $app }

                                    ALL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Common\Software Deployment\Available" -InputObject $NewCollection 
                                            Move-CMObject -FolderPath 'BEL:\Application\Common Apps' -InputObject $app}

                                    ATL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Aliant\Software Deployment\Available" -InputObject $NewCollection 
                                                Move-CMObject -FolderPath 'BEL:\Application\Aliant\Application' -InputObject $app}

                                    MED { Move-CMObject -FolderPath "BEL:\DeviceCollection\Media\Software Deployment\AD-Based Groups\Available" -InputObject $NewCollection
                                            Move-CMObject -FolderPath 'BEL:\Application\Media\Media Business Apps' -InputObject $app }

                                    MTS { Move-CMObject -FolderPath "BEL:\DeviceCollection\MTS\Software Deployment\Available" -InputObject $NewCollection
                                                Move-CMObject -FolderPath 'BEL:\Application\MTS\Application Deployment\Production' -InputObject $app }

                                    default { }
                        }

                if ($app)
                {
                $log.AppendText("`nApplication found in SCCM $($app.LocalizedDisplayName)")
                                                                                                                                                                                                                                                
                Get-CMApplication $app.LocalizedDisplayName | set-CMApplication -AutoInstall $true
                                                                                                                                                                                                                                                
                $deployment = New-CMApplicationDeployment -Name $app.LocalizedDisplayName -CollectionId $newcollection.CollectionID `
                -DeployPurpose Available -DeployAction Install -UserNotification DisplaySoftwareCenterOnly -TimeBaseOn LocalTime -PersistOnWriteFilterDevice $False -AvailableDateTime (Get-Date).AddMinutes(30)                                                                                                                                                                                                                                           
               $log.AppendText("`nNew deployment assignment ID is $($deployment.AssignmentID)")


 $obj = @"
  <h5>Hi Team,</h5>
<h5>AD group Deployment is created </h5>
<h3> SCCM Application Deployment summary Below</h3>
<table Border="2" >

	<tr>
		<th>CRQ or WO or REQ </th>
		<td>$($TextBoxcrq.Text)</td>
	</tr>
	<tr>
		<th>Application Name</th>
		<td>$($deployment.ApplicationName)</td>
	</tr>
    <tr>
		<th>Collection name</th>
		<td>$($deployment.CollectionName)</td>    
	</tr>
    <tr>
		<th>Collection ID</th>
		<td>$($deployment.TargetCollectionID)</td>    
    </tr>
    <tr>
		<th>Deploy Intent</th>
		<td>Available</td>    
    </tr>
    <tr>
		<th>AvailableTime</th>
		<td>$($deployment.StartTime)</td>    
    </tr>
        <tr>
		<th>App Deployment Id</th>
		<td>$($deployment.AssignmentID)</td>    
	</tr>

</table>


<p>Thanks,</p>
<p>$($env:USERNAME)</p>
<p>$($env:COMPUTERNAME)</p>
                                                            
"@

Send-Mail -To $($ComboBoxemail.SelectedItem) -CC $CCAddress -subject "AD Group Deployment Summary - $($deployment.ApplicationName)" -body $obj -From "MECM_Automation@bell.com" -AsHtml

   }else{$log.AppendText("`ncheck the application name")}               
               
              
              
              
}
      
                }
 }else{$log.AppendText("`nAdgroup name doesnt exist, please check Adgroup Name and try again")}
                
                                
                                    
                             
                              
                                             

                                             
}
                                                                                                                                                                                        


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Package~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    elseif($ComboBoxtech.SelectedItem -eq "Package")
   {
                              
 $AdgroupName = $TextBoxadgroup.Text
 $CM_Package =  $TextBoxappname.Text

 $log.AppendText("`nGiven ADgroup Name $($TextBoxadgroup.Text)")
 $log.AppendText("`nGiven Package ID $($TextBoxappname.Text)")

$ADGROUP = Get-ADGroup $AdgroupName -Properties * -Server bell.corp.bce.ca   #change server name, if required -server parameter
               
if ($ADGROUP.Name -eq $AdgroupName)
{
$log.AppendText("`r`n ADgroup Found in AD")
if($CheckBoxifuser.CheckState -eq "Checked")
{
              
    $existingcol = Get-CMUserCollection -Name $ADGROUP.Name
    If ($existingcol)
         {
         $log.Appendtext("`ncollection Exist, creating deployment with this collection, Please take care of any other deployments to this existing collection")
        $Global:package = Get-CMPackage -Fast -Id $($TextBoxappname.Text)
                                                                                                                                                                                                                    
        $Global:Naming = ($ADGROUP.Name).Substring(($ADGROUP.Name).Length -3)
        switch($naming)
            {
            BEL { Move-CMObject -FolderPath "BEL:\UserCollection\Bell" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Package\Bell\Software Deployment\Production' -InputObject $package }

            BELL { Move-CMObject -FolderPath "BEL:\UserCollection\Bell" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Package\Bell\Software Deployment\Production' -InputObject $package }

            ALL { Move-CMObject -FolderPath "BEL:\UserCollection\Common\Available" -InputObject $existingcol 
                    Move-CMObject -FolderPath 'BEL:\Package\Common Packages\Software Deployment' -InputObject $package}

            ATL { Move-CMObject -FolderPath "BEL:\UserCollection\Aliant\Software Deployment  Collections\Software Deployment Collections DESKTOP EVOLUTION\AD Security Group Software Deployments (User based)" -InputObject $existingcol 
                        Move-CMObject -FolderPath 'BEL:\Package\Aliant\SD_Aliant Software' -InputObject $package}

            MED { Move-CMObject -FolderPath "BEL:\UserCollection\Media\Software Publishing" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Package\Media' -InputObject $package }

            MTS { Move-CMObject -FolderPath "BEL:\UserCollection\MTS" -InputObject $existingcol
                        Move-CMObject -FolderPath 'BEL:\Package\MTS\Software Deployment\Production' -InputObject $package }

            default {Move-CMObject -FolderPath "BEL:\UserCollection\Common\Available" -InputObject $existingcol
                Move-CMObject -FolderPath 'BEL:\Package\Common Packages\Software Deployment' -InputObject $package}
            }

if ($package)
                {
                $log.AppendText("`nPackage found in SCCM $($package.Name)")
                                                                                                                                                                                                                                                
                Set-CMProgram -StandardProgram -ProgramName $($ComboBoxprogram.SelectedItem) -PackageId $($package.PackageID) -EnableTaskSequence $true
                
                $Deployment = New-CMPackageDeployment -PackageId $($package.PackageID) -ProgramName  $($ComboBoxprogram.SelectedItem) -DeployPurpose Available -StandardProgram -CollectionId $($existingcol.CollectionID) -AvailableDateTime $((get-date).AddMinutes(30))  -PersistOnWriteFilterDevice $False                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                           
                $log.AppendText("`nNew deployment ID is $($Deployment.AdvertisementID)")
                $mailRPTMembercount = $(Get-CMUserCollection -Id $($Deployment.CollectionID)).MemberCount
                $mailRPTLimitColName = $(Get-CMUserCollection -Id $($Deployment.CollectionID)).LimitToCollectionName
                $mailRPTCoLName = $(Get-CMUserCollection -Id $($Deployment.CollectionID)).Name


 $obj = @"
  <h5>Hi Team,</h5>
<h5>AD group Deployment is created </h5>
<h3> SCCM Package Deployment summary Below</h3>
<table Border="2" >

	<tr>
		<th>CRQ or WO or REQ </th>
		<td>$($TextBoxcrq.Text)</td>
	</tr>
	<tr>
		<th>Package Name</th>
		<td>$($package.Name)</td>
	</tr>
    <tr>
		<th>Package ID</th>
		<td>$($package.PackageID)</td>
	</tr>
    <tr>
		<th>Collection name</th>
		<td>$mailRPTCoLName</td>    
	</tr>
    <tr>
		<th>Collection ID</th>
		<td>$($Deployment.CollectionID)</td>    
    </tr>
    <tr>
		<th>Deploy Intent</th>
		<td>Available</td>    
    </tr>
    <tr>
		<th>AvailableTime</th>
		<td>$($Deployment.PresentTime)</td>    
    </tr>
        <tr>
		<th>Package Deployment Id</th>
		<td>$($Deployment.AdvertisementID)</td>    
	</tr>

</table>


<p>Thanks,</p>
<p>$($env:USERNAME)</p>
<p>$($env:COMPUTERNAME)</p>
                                                            
"@

Send-Mail -To $($ComboBoxemail.SelectedItem) -CC $CCAddress -subject "AD Group Deployment Summary - $($package.Name)" -body $obj -From "MECM_Automation@bell.com" -AsHtml

   }else{$log.AppendText("`ncheck the Pacakge ID")} 


                }else{
                $log.Appendtext("`nCreating collection")

                 $Schedule = New-CMSchedule -start "01/01/2021 12:00 AM" -DurationInterval Minutes -DurationCount 0 -IsUtc:$False -Nonrecurring                                                                                                                                                                                                
                 $query = "select SMS_R_USER.ResourceID,SMS_R_USER.ResourceType,SMS_R_USER.Name,SMS_R_USER.UniqueUserName,SMS_R_USER.WindowsNTDomain from SMS_R_User where SMS_R_User.UserGroupName = 'Bell\\$($Adgroup.Name)'"
                 $NewCollection = New-CMUserCollection -Name $Adgroup.Name -LimitingCollectionId 'SMS00002' -RefreshType None -RefreshSchedule $Schedule
                 $log.AppendText("`nNew collection created $($newcollection.CollectionID)")

                Add-CMUserCollectionQueryMembershipRule -CollectionName $Adgroup.Name -QueryExpression $query -RuleName $Adgroup.Name | Out-Null
                $log.AppendText("`nAdding Query")
                $log.AppendText("`n$query")

                $Global:package = Get-CMPackage -Fast -Id $($TextBoxappname.Text)
                                                                                                                                                                                                                               
                $Global:Naming = ($ADGROUP.Name).Substring(($ADGROUP.Name).Length -3)
                switch($naming)
                        {
                        BEL { Move-CMObject -FolderPath "BEL:\UserCollection\Bell" -InputObject $NewCollection
                                Move-CMObject -FolderPath 'BEL:\Package\Bell\Software Deployment\Production' -InputObject $package }

                        BELL { Move-CMObject -FolderPath "BEL:\UserCollection\Bell" -InputObject $NewCollection
                                Move-CMObject -FolderPath 'BEL:\Package\Bell\Software Deployment\Production' -InputObject $package }

                        ALL { Move-CMObject -FolderPath "BEL:\UserCollection\Common\Available" -InputObject $NewCollection 
                                Move-CMObject -FolderPath 'BEL:\Package\Common Packages\Software Deployment' -InputObject $package}

                        ATL { Move-CMObject -FolderPath "BEL:\UserCollection\Aliant\Software Deployment  Collections\Software Deployment Collections DESKTOP EVOLUTION\AD Security Group Software Deployments (User based)" -InputObject $NewCollection 
                                    Move-CMObject -FolderPath 'BEL:\Package\Aliant\SD_Aliant Software' -InputObject $package}

                        MED { Move-CMObject -FolderPath "BEL:\UserCollection\Media\Software Publishing" -InputObject $NewCollection
                                Move-CMObject -FolderPath 'BEL:\Package\Media' -InputObject $package }

                        MTS { Move-CMObject -FolderPath "BEL:\UserCollection\MTS" -InputObject $NewCollection
                                    Move-CMObject -FolderPath 'BEL:\Package\MTS\Software Deployment\Production' -InputObject $package }

                        default {Move-CMObject -FolderPath "BEL:\UserCollection\Common\Available" -InputObject $NewCollection
                            Move-CMObject -FolderPath 'BEL:\Package\Common Packages\Software Deployment' -InputObject $package}
                        }

                if ($package)
                {
                $log.AppendText("`npackage found in SCCM $($package.Name)")
                                                                                                                                                                                                                                                
                Set-CMProgram -StandardProgram -ProgramName $($ComboBoxprogram.SelectedItem) -PackageId $($package.PackageID) -EnableTaskSequence $true
                                                                                                                                                                                                                                                
                $Deployment = New-CMPackageDeployment -PackageId $($package.PackageID) -ProgramName  $($ComboBoxprogram.SelectedItem) -DeployPurpose Available -StandardProgram -CollectionId $($NewCollection.CollectionID) -AvailableDateTime $((get-date).AddMinutes(30))  -PersistOnWriteFilterDevice $False                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                           
                $log.AppendText("`nNew deployment ID is $($Deployment.AdvertisementID)")
                $mailRPTMembercount = $(Get-CMUserCollection -Id $($Deployment.CollectionID)).MemberCount
                $mailRPTLimitColName = $(Get-CMUserCollection -Id $($Deployment.CollectionID)).LimitToCollectionName
                $mailRPTCoLName = $(Get-CMUserCollection -Id $($Deployment.CollectionID)).Name


 $obj = @"
  <h5>Hi Team,</h5>
<h5>AD group Deployment is created </h5>
<h3> SCCM Package Deployment summary Below</h3>
<table Border="2" >

	<tr>
		<th>CRQ or WO or REQ </th>
		<td>$($TextBoxcrq.Text)</td>
	</tr>
	<tr>
		<th>Package Name</th>
		<td>$($package.Name)</td>
	</tr>
    <tr>
		<th>Package ID</th>
		<td>$($package.PackageID)</td>
	</tr>
    <tr>
		<th>Collection name</th>
		<td>$mailRPTCoLName</td>    
	</tr>
    <tr>
		<th>Collection ID</th>
		<td>$($Deployment.CollectionID)</td>    
    </tr>
    <tr>
		<th>Deploy Intent</th>
		<td>Available</td>    
    </tr>
    <tr>
		<th>AvailableTime</th>
		<td>$($Deployment.PresentTime)</td>    
    </tr>
        <tr>
		<th>Package Deployment Id</th>
		<td>$($Deployment.AdvertisementID)</td>    
	</tr>

</table>


<p>Thanks,</p>
<p>$($env:USERNAME)</p>
<p>$($env:COMPUTERNAME)</p>
                                                            
"@

Send-Mail -To $($ComboBoxemail.SelectedItem) -CC $CCAddress -subject "AD Group Deployment Summary - $($package.Name)" -body $obj -From "MECM_Automation@bell.com" -AsHtml

   }else{$log.AppendText("`ncheck the Package ID ")}               
               
              
              
              
}
      
                }
elseif($CheckBoxifuser.CheckState -eq "Unchecked"){

$existingcol = Get-CMDeviceCollection -Name $ADGROUP.Name 
If ($existingcol)
{
$log.Appendtext("`ncollection Exist, creating deployment with this collection, Please take care of any other deployments to this existing collection and its variable")

$Global:package = Get-CMPackage -Fast -Id $($TextBoxappname.Text)
Remove-CMDeviceCollectionVariable -CollectionName $existingcol.Name -VariableName $Adgroup.Name -Force
New-CMDeviceCollectionVariable -CollectionName $($existingcol.Name) -VariableName $Adgroup.Name -Value "$($package.PackageID):$($ComboBoxprogram.SelectedItem)" -IsMask $False | Out-Null

$log.AppendText("`nAdding Collection Variable")          
                                                                                                                                                                                                               
            $Global:Naming = ($ADGROUP.Name).Substring(($ADGROUP.Name).Length -3)
            switch($naming)
            {
            BEL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Bell\Software Deployment\Available" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Package\Bell\Software Deployment\Production' -InputObject $package }

            BELL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Bell\Software Deployment\Available" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Package\Bell\Software Deployment\Production' -InputObject $package }

            ALL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Common\Software Deployment\Available" -InputObject $existingcol 
                    Move-CMObject -FolderPath 'BEL:\Package\Common Packages\Software Deployment' -InputObject $package}

            ATL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Aliant\Software Deployment\Available" -InputObject $existingcol 
                        Move-CMObject -FolderPath 'BEL:\Package\Aliant\SD_Aliant Software' -InputObject $package}

            MED { Move-CMObject -FolderPath "BEL:\DeviceCollection\Media\Software Deployment\AD-Based Groups\Available" -InputObject $existingcol
                    Move-CMObject -FolderPath 'BEL:\Package\Media' -InputObject $package }

            MTS { Move-CMObject -FolderPath "BEL:\DeviceCollection\MTS\Software Deployment\Available" -InputObject $existingcol
                        Move-CMObject -FolderPath 'BEL:\Package\MTS\Software Deployment\Production' -InputObject $package }

            default { 
                   Move-CMObject -FolderPath "BEL:\DeviceCollection\Common\Software Deployment\Available" -InputObject $existingcol 
                    Move-CMObject -FolderPath 'BEL:\Packages\Common Packages\Software Deployment' -InputObject $package
                       }
            }

if ($package)
                {
                $log.AppendText("`nPackage found in SCCM $($package.Name)")
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                
                Set-CMProgram -StandardProgram -ProgramName $($ComboBoxprogram.SelectedItem) -PackageId $($package.PackageID) -EnableTaskSequence $true
                                                                                                                                                                                                                                                
                $Deployment = New-CMPackageDeployment -PackageId $($package.PackageID) -ProgramName  $($ComboBoxprogram.SelectedItem) -DeployPurpose Available -StandardProgram -CollectionId $($existingcol.CollectionID) -AvailableDateTime $((get-date).AddMinutes(30))  -PersistOnWriteFilterDevice $False                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                           
                $log.AppendText("`nNew deployment assignment ID is $($Deployment.AdvertisementID)")
                $mailRPTMembercount = $(Get-CMDeviceCollection -Id $($Deployment.CollectionID)).MemberCount
                $mailRPTLimitColName = $(Get-CMDeviceCollection -Id $($Deployment.CollectionID)).LimitToCollectionName
                $mailRPTCoLName = $(Get-CMDeviceCollection -Id $($Deployment.CollectionID)).Name


 $obj = @"
  <h5>Hi Team,</h5>
<h5>AD group Deployment is created </h5>
<h3> SCCM Package Deployment summary Below</h3>
<table Border="2" >

	<tr>
		<th>CRQ or WO or REQ </th>
		<td>$($TextBoxcrq.Text)</td>
	</tr>
	<tr>
		<th>Package Name</th>
		<td>$($package.Name)</td>
	</tr>
    <tr>
		<th>Package ID</th>
		<td>$($package.PackageID)</td>
	</tr>
    <tr>
		<th>Collection name</th>
		<td>$mailRPTCoLName</td>    
	</tr>
    <tr>
		<th>Collection ID</th>
		<td>$($Deployment.CollectionID)</td>    
    </tr>
    <tr>
		<th>Deploy Intent</th>
		<td>Available</td>    
    </tr>
    <tr>
		<th>AvailableTime</th>
		<td>$($Deployment.PresentTime)</td>    
    </tr>
        <tr>
		<th>Package Deployment Id</th>
		<td>$($Deployment.AdvertisementID)</td>    
	</tr>

</table>


<p>Thanks,</p>
<p>$($env:USERNAME)</p>
<p>$($env:COMPUTERNAME)</p>
                                                            
"@

Send-Mail -To $($ComboBoxemail.SelectedItem) -CC $CCAddress -subject "AD Group Deployment Summary - $($package.Name)" -body $obj -From "MECM_Automation@bell.com" -AsHtml

   }else{$log.AppendText("`ncheck the Package name")} 


                }else{
                $log.Appendtext("`nCreating collection")

                 $Schedule = New-CMSchedule -start "01/01/2021 12:00 AM" -DurationInterval Minutes -DurationCount 0 -IsUtc:$False -Nonrecurring                                                                                                                                                                                                
                 $query = "select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System where SMS_R_System.SystemGroupName = 'Bell\\$($Adgroup.Name)'"
                 $NewCollection = New-CMDeviceCollection -Name $Adgroup.Name -LimitingCollectionId 'SMS00001' -RefreshType None -RefreshSchedule $Schedule
                 $log.AppendText("`nNew collection created $($newcollection.CollectionID)")

                Add-CMDeviceCollectionQueryMembershipRule -CollectionName $Adgroup.Name -QueryExpression $query -RuleName $Adgroup.Name | Out-Null
                $log.AppendText("`nadding query")
                $log.AppendText("`n $query")
                
                $Global:package = Get-CMPackage -Fast -Id $($TextBoxappname.Text)
                New-CMDeviceCollectionVariable -CollectionName $($NewCollection.Name) -VariableName $Adgroup.Name -Value "$($package.PackageID):$($ComboBoxprogram.SelectedItem)" -IsMask $False | Out-Null

                $log.AppendText("`nAdding Collection Variable")          
                                                                                                                                                                                                               
                $Global:Naming = ($ADGROUP.Name).Substring(($ADGROUP.Name).Length -3)
                switch($naming)
                        {
                    BEL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Bell\Software Deployment\Available" -InputObject $NewCollection
                            Move-CMObject -FolderPath 'BEL:\Package\Bell\Software Deployment\Production' -InputObject $package }

                    BELL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Bell\Software Deployment\Available" -InputObject $NewCollection
                            Move-CMObject -FolderPath 'BEL:\Package\Bell\Software Deployment\Production' -InputObject $package }

                    ALL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Common\Software Deployment\Available" -InputObject $NewCollection 
                            Move-CMObject -FolderPath 'BEL:\Package\Common Packages\Software Deployment' -InputObject $package}

                    ATL { Move-CMObject -FolderPath "BEL:\DeviceCollection\Aliant\Software Deployment\Available" -InputObject $NewCollection 
                                Move-CMObject -FolderPath 'BEL:\Package\Aliant\SD_Aliant Software' -InputObject $package}

                    MED { Move-CMObject -FolderPath "BEL:\DeviceCollection\Media\Software Deployment\AD-Based Groups\Available" -InputObject $NewCollection
                            Move-CMObject -FolderPath 'BEL:\Package\Media' -InputObject $package }

                    MTS { Move-CMObject -FolderPath "BEL:\DeviceCollection\MTS\Software Deployment\Available" -InputObject $NewCollection
                                Move-CMObject -FolderPath 'BEL:\Package\MTS\Software Deployment\Production' -InputObject $package }

                    default { 
                           Move-CMObject -FolderPath "BEL:\DeviceCollection\Common\Software Deployment\Available" -InputObject $NewCollection 
                            Move-CMObject -FolderPath 'BEL:\Package\Common Packages\Software Deployment' -InputObject $package
                               }
                        }

                if ($package)
                {
                
                                                                                                                                                                                                                                                
                $log.AppendText("`nPackage found in SCCM $($package.Name)")
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                
                Set-CMProgram -StandardProgram -ProgramName $($ComboBoxprogram.SelectedItem) -PackageId $($package.PackageID) -EnableTaskSequence $true
                                                                                                                                                                                                                                                
                $Deployment = New-CMPackageDeployment -PackageId $($package.PackageID) -ProgramName  $($ComboBoxprogram.SelectedItem) -DeployPurpose Available -StandardProgram -CollectionId $($NewCollection.CollectionID) -AvailableDateTime $((get-date).AddMinutes(30))  -PersistOnWriteFilterDevice $False                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                           
                $log.AppendText("`nNew deployment ID is $($Deployment.AdvertisementID)")
                $mailRPTMembercount = $(Get-CMDeviceCollection -Id $($Deployment.CollectionID)).MemberCount
                $mailRPTLimitColName = $(Get-CMDeviceCollection -Id $($Deployment.CollectionID)).LimitToCollectionName
                $mailRPTCoLName = $(Get-CMDeviceCollection -Id $($Deployment.CollectionID)).Name


 $obj = @"
  <h5>Hi Team,</h5>
<h5>AD group Deployment is created </h5>
<h3> SCCM Package Deployment summary Below</h3>
<table Border="2" >

	<tr>
		<th>CRQ or WO or REQ </th>
		<td>$($TextBoxcrq.Text)</td>
	</tr>
		<th>Package Name</th>
		<td>$($package.Name)</td>
	</tr>
    <tr>
		<th>Package ID</th>
		<td>$($package.PackageID)</td>
	</tr>
    <tr>
		<th>Collection name</th>
		<td>$mailRPTCoLName</td>    
	</tr>
    <tr>
		<th>Collection ID</th>
		<td>$($Deployment.CollectionID)</td>    
    </tr>
    <tr>
		<th>Deploy Intent</th>
		<td>Available</td>    
    </tr>
    <tr>
		<th>AvailableTime</th>
		<td>$($Deployment.PresentTime)</td>    
    </tr>
        <tr>
		<th>Package Deployment Id</th>
		<td>$($Deployment.AdvertisementID)</td>    
	</tr>

</table>


<p>Thanks,</p>
<p>$($env:USERNAME)</p>
<p>$($env:COMPUTERNAME)</p>
                                                            
"@

Send-Mail -To $($ComboBoxemail.SelectedItem) -CC $CCAddress -subject "AD Group Deployment Summary - $($package.Name)" -body $obj -From "MECM_Automation@bell.com" -AsHtml

   }else{$log.AppendText("`ncheck the application name")}               
               
              
              
              
}
      
                }
 }else{$log.AppendText("`nAdgroup name doesnt exist, please check Adgroup Name and try again")}
                
                                
                                    
                             
                              
                                             

                                             
}


}

function ButtonvalidateClick( $object ){}
function exitmenuclicked($object){
$Tool.Close()
}

function aboutmenuclicked($Object){
  $aboutForm = New-Object System.Windows.Forms.Form
  $aboutForm.Text = "About"
  $aboutForm.Size = New-Object System.Drawing.Size(300,200)
  $aboutForm.StartPosition = "CenterScreen"
  $aboutForm.Topmost = $true

  $aboutTextBox = New-Object System.Windows.Forms.TextBox
  $aboutTextBox.Multiline = $true
  $aboutTextBox.ReadOnly = $true
  $aboutTextBox.Font = New-Object System.Drawing.Font("Verdana", 7.75, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte](0)))
  $aboutTextBox.Text = @"
AD Group Deployment Tool
Copyright (c) 2024 by Praveen Kumar, Antony

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
"@

  $aboutTextBox.Dock = "Fill"

  $aboutForm.Controls.Add($aboutTextBox)
  $aboutForm.Add_Shown({ $aboutForm.Activate() })
  $aboutForm.ShowDialog()
}

function helpmenuclicked($object){
  Start-Process "https://github.com/Praveenn-Ak/ADGROUPDeploymentTool"
}


function ButtonExitClick( $object ){
$Tool.Close()

}

function TextBoxadgroupTextChanged( $object ){}

function TextBoxappnameTextChanged( $object ){
    if($ComboBoxtech.SelectedItem -eq "Package")
                {
            $PckgID = $TextBoxappname.Text
            $programs = (Get-CMProgram -PackageId $PckgID).Programname
            foreach ($prgrm in $programs) {$ComboBoxprogram.Items.Add($prgrm)}

                }
}

function CheckBoxifuserCheckedChanged( $object ){}

function ToolLoad( $object ){}

Main # This call must remain below all other event functions

#endregion
#region Script Settings
#<ScriptSettings xmlns="http://tempuri.org/ScriptSettings.xsd">
#  <ScriptPackager>
#    <process>powershell.exe</process>
#    <arguments />
#    <extractdir>%TEMP%</extractdir>
#    <files />
#    <usedefaulticon>true</usedefaulticon>
#    <showinsystray>false</showinsystray>
#    <altcreds>false</altcreds>
#    <efs>true</efs>
#    <ntfs>true</ntfs>
#    <local>false</local>
#    <abortonfail>true</abortonfail>
#    <product />
#    <version>1.0.0.1</version>
#    <versionstring />
#    <comments />
#    <company />
#    <includeinterpreter>false</includeinterpreter>
#    <forcecomregistration>false</forcecomregistration>
#    <consolemode>false</consolemode>
#    <EnableChangelog>false</EnableChangelog>
#    <AutoBackup>false</AutoBackup>
#    <snapinforce>false</snapinforce>
#    <snapinshowprogress>false</snapinshowprogress>
#    <snapinautoadd>2</snapinautoadd>
#    <snapinpermanentpath />
#    <cpumode>1</cpumode>
#    <hidepsconsole>false</hidepsconsole>
#  </ScriptPackager>
#</ScriptSettings>
#endregion
