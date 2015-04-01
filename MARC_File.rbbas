#tag Class
Protected Class MARC_File
	#tag Method, Flags = &h0
		Sub Constructor(f as folderItem)
		  dim s as string
		  dim input as TextInputStream
		  dim groups() as string
		  
		  file = f
		  
		  input = f.OpenAsTextFile
		  input.encoding = app.DefaultEncoding
		  s = input.readAll
		  input.close
		  
		  groups = split(s, group_separator )
		  
		  for each group as string in groups
		    if group.len > 24 then
		      records.append new MARC_Record(group)
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(r as MARC_Record)
		  records.append( r )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(s as string)
		  dim groups() as string
		  
		  groups = split(s, group_separator )
		  
		  for each group as string in groups
		    if group.len > 24 then
		      records.append new MARC_Record(group)
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove_Tags(tag_list_comma_delimited as string)
		  for each record as MARC_Record in records
		    record.remove_tags( tag_list_comma_delimited )
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save_To_File(f as FolderItem)
		  dim i as integer
		  dim output as TextOutputStream
		  
		  if f <> nil then
		    
		    output = f.CreateTextFile
		    
		    for each record as MARC_Record in records
		      output.write record.to_string
		    next
		    
		    output.close
		    
		    file = f
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort_Records(tag as string, order as integer, subfield as string = "", ignore_leading_words as string = "")
		  dim tag_values() as string
		  dim i as integer
		  dim r as MARC_Record
		  dim s as string
		  dim words() as string
		  
		  if ignore_leading_words <> "" then
		    words = ignore_leading_words.split(",")
		  end if
		  
		  for i = 0 to records.Ubound
		    s = records(i).get_field(tag, subfield)
		    for each word as string in words
		      if left(s, word.len + 1) = word + " " then
		        s = mid(s, word.len + 2)
		      end if
		    next
		    tag_values.append( s )
		  next
		  
		  tag_values.SortWith( records )
		  
		  if order = descending then
		    for i = 0 to floor(records.Ubound * 0.5)
		      r = records(i)
		      records(i) = records( records.ubound - i )
		      records( records.ubound - i ) = r
		    next
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		file As FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ubound(records) + 1
			End Get
		#tag EndGetter
		RecordCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		records() As MARC_Record
	#tag EndProperty


	#tag Constant, Name = ascending, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = descending, Type = Double, Dynamic = False, Default = \"2", Scope = Public
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
			Name="RecordCount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
	#tag EndViewBehavior
End Class
#tag EndClass
