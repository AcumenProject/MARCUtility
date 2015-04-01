#tag Class
Protected Class EncodingMenuItem
Inherits Menuitem
	#tag Event
		Function Action() As Boolean
		  app.DefaultEncoding = encoding
		  
		  if checkedItem <> nil then
		    checkedItem.Checked = false
		  end if
		  
		  me.Checked = true
		  checkedItem = me
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		Shared checkedItem As EncodingMenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		encoding As TextEncoding
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoEnable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyboardShortcut"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Menuitem"
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
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Bold"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Italic"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Underline"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="Menuitem"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
