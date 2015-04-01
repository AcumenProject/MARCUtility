#tag Class
Protected Class MARC_Record
	#tag Method, Flags = &h0
		Sub Constructor(group as string)
		  dim records() as string
		  dim header as string
		  dim s as string
		  dim i as integer
		  
		  records = split( group, record_separator )
		  header = records(0)
		  // Load Header Info
		  
		  // Check for blank spaces where they should be
		  select case header.Mid(10,1)
		  case "a"
		    unicode = true
		  case " "
		    unicode = false
		  case else
		    Assert( false, "Header character 10 should be blank or a" )
		  end select
		  Assert( header.Mid(20,1) = " ", "Blank header character 20 should be blank" )
		  // Assert( header.Mid(24,1) = " ", "Blank header character 24 should be blank" )
		  
		  // Check for fixed values where they should be
		  Assert( header.Mid(22,1) = "5", "Starting character position should be 5." )
		  Assert( header.Mid(23,1) = "0", "Implementation defined portion in directory should be 0." )
		  
		  Record_Length = val(header.Left(5))
		  Status = header.Mid(6,1)
		  Type = header.Mid(7,1)
		  Bibliographic_Level = header.Mid(8,1)
		  Hierarchical_Level = header.Mid(9,1)
		  Indicator_Length = val(header.Mid(11,1))
		  Subfield_Code_Length = val(header.Mid(12,1))
		  Base_Address_of_Data = val(header.Mid(13,5))
		  Descriptive_Cataloging_Form = header.Mid(19,1)
		  Length_Field_Length = val(header.Mid(21,1)) // 4 for UNIMARC, 3 for BLCMPMARC
		  
		  file_header = header.left(24)
		  header = header.mid(25) // ditch that crap
		  if unicode then
		    header = ConvertString( header, encodings.ASCII, encodings.UTF8 )
		  end if
		  
		  while header.Len > 11
		    s = left(header,12)
		    directory_entries.append s
		    tags.append( s.left(3) )
		    field_lengths.append( val(s.mid( 8 - Length_Field_Length, Length_Field_Length ) ) )
		    field_offsets.append( val(s.right(5)) )
		    header = header.mid(13)
		  wend
		  
		  for i = 0 to directory_entries.Ubound
		    s = group.Mid( Base_Address_of_Data + field_offsets(i) + 1, field_lengths(i) - 1 )
		    if CountFields(s, unit_separator) > 1 then
		      indicators.append nthField(s, unit_separator, 1)
		      s = s.mid(len(NthField(s, unit_separator, 1)) + 2)
		    else
		      indicators.append ""
		    end if
		    fields.append s
		    if tags(i) = "245" then
		      main_title = s
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_field(which_field as integer, subfield as string = "") As string
		  if which_field > fields.ubound then
		    return ""
		  else
		    return get_subfield( fields(which_field), subfield )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_field(tag as String, subfield as string = "", regex_filter as string = "") As String
		  dim i as integer
		  dim s as string = ""
		  
		  for i = 0 to Tags.Ubound
		    if tags(i) = tag then
		      s = get_subfield( fields(i), subfield )
		    end if
		  next
		  
		  if regex_filter <> "" then
		    return grep( s, regex_filter )
		  end if
		  
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_subfield(field as string, subfield as string) As string
		  dim i as integer
		  dim subfields() as string
		  
		  if subfield = "" then
		    return field
		  end if
		  
		  subfields = field.split( unit_separator )
		  for i = 0 to subfields.Ubound
		    if left(subfields(i), 1) = subfield then
		      return mid(subfields(i), 2)
		    end if
		  next
		  
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_subfield_count(which_field as integer) As integer
		  if which_field > fields.ubound or fields(which_field) = "" then
		    return 0
		  else
		    return countFields( fields(which_field), unit_separator )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_subfield_count(tag as String) As integer
		  dim field as string
		  
		  field = get_field(tag)
		  
		  if( field = "" ) then
		    return 0
		  else
		    return CountFields( field, unit_separator )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_subfield_id(which_field as integer, which_subfield as integer) As string
		  if which_field > fields.ubound or fields(which_field) = "" then
		    return ""
		  else
		    return left( nthField( fields(which_field), unit_separator, which_subfield ), 1 )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_subfield_id(tag as string, which as integer) As string
		  dim field as string
		  
		  field = get_field(tag)
		  
		  if field = "" then
		    return ""
		  else
		    return left( NthField( field, unit_separator, which ), 1 )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function parsed_directory_entry(i as integer) As string
		  dim s as string
		  
		  s = directory_entries(i)
		  
		  if Length_Field_Length = 4 then
		    return s.left(3) + "-" + s.mid(4,4) + "-" + s.right(5)
		  else
		    return s.left(3) + "-" + s.mid(4,1) + "-" + s.mid(5,3) + "-" + s.right(5)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub remove_tag(tag as String)
		  dim i as integer
		  
		  for i = tags.ubound downTo 0
		    if tags(i) = tag then
		      tags.remove(i)
		      indicators.remove(i)
		      fields.remove(i)
		      field_offsets.remove(i)
		      directory_entries.remove(i)
		      field_lengths.remove(i)
		      dirty = true
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub remove_tags(tags_comma_delimited as String)
		  dim tag_list() as string
		  
		  tag_list = split(tags_comma_delimited, ",")
		  
		  for each tag as string in tag_list
		    remove_tag(tag)
		  next
		  
		  repair
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub repair()
		  dim i as integer
		  dim s as string
		  
		  if dirty then
		    // repair offsets
		    for i = 1 to field_offsets.ubound
		      field_offsets(i) = field_offsets(i - 1) + field_lengths(i - 1)
		    next
		    
		    // repair directory entries
		    for i = 0 to directory_entries.ubound
		      s = directory_entries(i)
		      if Length_Field_Length = 4 then
		        directory_entries(i) =  s.left(3) + format( field_lengths(i), "0000" ) + format( field_offsets(i), "00000" )
		      else
		        directory_entries(i) =  s.left(4) + format( field_lengths(i), "000" ) + format( field_offsets(i), "00000" )
		      end if
		    next
		    
		    Base_Address_of_Data = 24 + (directory_entries.ubound + 1) * 12 + 1 // includes the record_separator
		    Record_Length = Base_Address_of_Data + field_offsets(field_offsets.Ubound) + field_lengths(field_lengths.ubound) + 1 // includes the terminal group_separator
		    file_header = format(Record_Length, "00000") + file_header.mid(6,7) + format( Base_Address_of_Data, "00000" ) + file_header.mid(18)
		    
		    dirty = false
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set_field(tag as string, value as string, subfield as string = "")
		  dim i as integer
		  dim subfields() as string
		  
		  for i = 0 to tags.ubound
		    if tags(i) = tag then
		      fields(i) = set_subfield(fields(i), subfield, value)
		      return
		    elseif val(tags(i)) > val(tag) then
		      tags.Insert(i, tag)
		      fields.Insert(i, set_subfield("", subfield, value))
		      return
		    end if
		  next
		  
		  tags.append tag
		  fields.append set_subfield("", subfield, value)
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function set_subfield(field as string, subfield as string, value as String) As String
		  dim i as integer
		  dim subfields() as string
		  
		  if field = "" then
		    return subfield + value
		  end if
		  
		  subfields = field.split( unit_separator )
		  for i = 0 to subfields.Ubound
		    if left(subfields(i), 1) = subfield then
		      subfields(i) = subfield + value
		    end if
		  next
		  
		  return join( subfields, unit_separator )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function to_string() As string
		  dim s as string
		  dim i as integer
		  
		  s = file_header
		  
		  if unicode then
		    s = convertString( s, encodings.UTF8, encodings.ASCII )
		  end if
		  
		  for each entry as string in directory_entries
		    s = s + entry
		  next
		  
		  s = s + record_separator
		  
		  for i = 0 to indicators.Ubound
		    if indicators(i).len = 2 then
		      s = s + indicators(i) + unit_separator + fields(i) + record_separator
		    else
		      s = s + fields(i) + record_separator
		    end if
		  next
		  
		  s = s + group_separator
		  
		  return s
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Base_Address_of_Data As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Bibliographic_Level As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Descriptive_Cataloging_Form As String
	#tag EndProperty

	#tag Property, Flags = &h0
		directory_entries() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		dirty As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Encoding_Level As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FieldOffsets() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		fields() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		field_lengths() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		field_offsets() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		file_header As string
	#tag EndProperty

	#tag Property, Flags = &h0
		flag_color As Color = &cffffff
	#tag EndProperty

	#tag Property, Flags = &h0
		Hierarchical_Level As String
	#tag EndProperty

	#tag Property, Flags = &h0
		indicators() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Indicator_Length As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Length_Field_Length As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		main_title As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Record_Length As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Status As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Subfield_Code_Length As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Tags() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Unicode As boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Base_Address_of_Data"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bibliographic_Level"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Descriptive_Cataloging_Form"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="dirty"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Encoding_Level"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="file_header"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="flag_color"
			Group="Behavior"
			InitialValue="&cffffff"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hierarchical_Level"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indicator_Length"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Length_Field_Length"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="main_title"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Record_Length"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Status"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Subfield_Code_Length"
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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Unicode"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
