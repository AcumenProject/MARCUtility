#tag Module
Protected Module Voyager_Utilities
	#tag Method, Flags = &h0
		Function GetBibIdFromOCLC(oclc as string) As int64
		  ' SELECT BIB_ID
		  ' FROM BIB_INDEX
		  ' WHERE INDEX_CODE = '035A' AND NORMAL_HEADING =  '23380164'
		  
		  dim db as OracleDatabase
		  Dim rs as RecordSet
		  Dim i as integer
		  Dim data as string
		  
		  db = VoyagerConnect()
		  
		  if db = nil then
		    return 0
		  end if
		  
		  rs = db.SQLSelect( "SELECT BIB_ID FROM BIB_INDEX WHERE INDEX_CODE = '035A' AND NORMAL_HEADING = '" + oclc + "'" )
		  
		  if rs = nil then
		    return 0
		  end if
		  
		  if rs.RecordCount <> 1 then
		    return 0
		  end if
		  
		  return rs.IdxField(1).Int64Value
		  
		Exception
		  return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBibRecord(bib_id as Int64) As MARC_File
		  ' GET RECORD_SEGMENT FROM BIB_DATA WHERE BIB_DATA.BIB_ID = 710626 ORDER_BY SEQNUM
		  
		  dim db as OracleDatabase
		  Dim rs as RecordSet
		  Dim i as integer
		  Dim data as string
		  
		  db = VoyagerConnect()
		  
		  if db = nil then
		    return nil
		  end if
		  
		  rs = db.SQLSelect( "SELECT RECORD_SEGMENT FROM BIB_DATA WHERE BIB_ID = " + str( bib_id ) + " ORDER BY BIB_ID, SEQNUM" )
		  
		  if rs = nil then
		    return nil
		  end if
		  
		  While not rs.eof
		    data = data + rs.IdxField(1).StringValue
		    rs.MoveNext
		  wend
		  
		  return new MARC_File( data )
		Exception
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVoyagerSettings() As boolean
		  dim f as folderItem
		  
		  f = SpecialFolder.Preferences.child( voyager_settings_filename )
		  
		  if f.exists then
		    dim s, p() as string
		    s = f.loadTextFile
		    p = s.split( chr(10) )
		    if p.ubound = 3 then
		      voyager_host = p(0)
		      voyager_db = p(1)
		      voyager_username = p(2)
		      voyager_password = p(3)
		      return true
		    end if
		  end if
		  
		  dim d as new wndVoyagerSettings
		  
		  d.ShowModal
		  
		  if not d.cancelled then
		    voyager_host = d.txtHost.text
		    voyager_db = d.txtDB.text
		    voyager_username = d.txtUser.text
		    voyager_password = d.txtPassword.text
		    
		    return true
		  else
		    return false
		  end if
		  
		  d.close
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VoyagerConnect() As OracleDatabase
		  dim db as new OracleDatabase
		  
		  if not GetVoyagerSettings() then
		    return nil
		  end if
		  
		  db = New OracleDatabase
		  db.host = voyager_host // "130.160.4.75"
		  db.DatabaseName = voyager_DB // "VGER"
		  db.UserName = voyager_username // "ro_uadb"
		  db.Password = voyager_password // "ro_uadb"
		  db.debug = 1 'look in the console
		  
		  If not db.connect() then
		    MsgBox "Error: could not connect to Voyager." + chr(13) + chr(13) + db.ErrorMessage
		    db.close
		    db = nil
		  End if
		  
		  return db
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function voyager_query(bib_id as uint64, field as string, subfield as string = "", regex_filter as string = "") As string
		  dim f as MARC_File
		  dim s as string
		  
		  f = GetBibRecord( bib_id )
		  
		  if f.RecordCount > 0 then
		    s = f.records(0).get_field( field, subfield, regex_filter )
		  end if
		  
		  return s
		  
		Exception
		  return ""
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		voyager_db As string
	#tag EndProperty

	#tag Property, Flags = &h0
		voyager_host As string
	#tag EndProperty

	#tag Property, Flags = &h0
		voyager_password As string
	#tag EndProperty

	#tag Property, Flags = &h0
		voyager_username As string
	#tag EndProperty


	#tag Constant, Name = voyager_settings_filename, Type = String, Dynamic = False, Default = \"MARC Utilities Voyager.txt", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="voyager_db"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="voyager_host"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="voyager_password"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="voyager_username"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
