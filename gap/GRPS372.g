#! @Chapter Groups of Order 3^7*2
#! @Section Overview
#!
#! This package gives access to all of the groups of order 3^7*2 through the small groups library. Once the package is loaded the groups of order 3^7*2 may be accessed via <C>SmallGroups(3^7*2,n)</C>.
#!

layer_3_7_2 := Length(SMALL_AVAILABLE_FUNCS)+1;

pos_3_7_2:= Maximum(List([
        SMALL_GROUP_FUNCS,
        SMALL_GROUPS_INFORMATION,
        NUMBER_SMALL_GROUPS_FUNCS,
        ID_GROUP_FUNCS,
        SELECT_SMALL_GROUPS_FUNCS,
    ], Length)) + 1;


SMALL_AVAILABLE_FUNCS[layer_3_7_2] := function( size )
    if size = 3^7*2 then
        return rec (
            lib := layer_3_7_2,
            func := pos_3_7_2,
            number := 24037);
    fi;
    return fail;
end;


ID_AVAILABLE_FUNCS[layer_3_7_2] := function( size )
    return fail;

end;

# Method for SmallGroup(3^8*2,i)
# The groups are stored in separate layers. 
SMALL_GROUP_FUNCS[ pos_3_7_2 ] := function( size, i, inforec )
    # local l, j, k, layer_id, layer_position, toRead, split_size_1, split_size_2,layer_change,offset;

    if i > inforec.number then 
        Error("there are just ",inforec.number," groups of order ",size );
    fi;
#the first 22 layers contain 31630 groups
#layers 23-60 contain 31629 groups
#Future Notes: If the size of the layers change then we need only change the following three lines, layer_change is the last layer which has the size of split_size_1, we assume the remaining layers have split_size 2
    # split_size_1:=31630; 
    # layer_change:=22;
    # split_size_2:=31629;
	# if QuoInt(i,split_size_1)+1 <= layer_change then
	    # layer_id:=QuoInt(i,split_size_1)+1;
	    # layer_position:=RemInt(i,split_size_1);

	    # if layer_position = 0 then
		# layer_position := split_size_1;
	    # fi;
	# else
	    # offset:=(layer_change*split_size_1)-1;
	    # layer_id:=QuoInt(i-offset,split_size_2)+1;
	    # layer_position:=RemInt(i,split_size_2);

	    # if layer_position = 0 then
		# layer_position := split_size_2;
	    # fi;
	# fi;
    # split_size_1:=30000; 
    # layer_change:=63;
    # # split_size_2:=31629;
	# if QuoInt(i,split_size_1) <= layer_change then
	    # # layer_id:=QuoInt(i,split_size_1)+1;
	    # layer_position:=RemInt(i,split_size_1);

	    # if layer_position = 0 then
		# layer_id:=QuoInt(i,split_size_1);
		# layer_position := split_size_1;
	    # else
	       # layer_id:=QuoInt(i,split_size_1)+1;
	    # fi;
	# else
	    # offset:=(layer_change*split_size_1)-1;
	    # layer_id:=64;
	    # # layer_id:=QuoInt(i-offset,split_size_2)+1;
	    # layer_position:=i-offset;

	    # if layer_position = 0 then
		# layer_position := split_size_2;
	    # fi;
	# fi;

    if not IsBound( SMALL_GROUP_LIB[ 4374 ] ) then 
        # SMALL_GROUP_LIB[ 13122 ] := [];
	ReadPackage("GRPS382","gap/ordering_3_7_2.g");
    fi;
	# PrintFormatted("Looking for {} layer_id and layer_position {}\n",layer_id,layer_position);

    # if not IsBound( SMALL_GROUP_LIB[13122][layer_id] ) then
	# toRead:=StringFormatted("gap/order/extensions_3_8_2_{}.g",layer_id);
	# ReadPackage("GRPS382",toRead);
    # fi;


    # return PcGroupCode( SMALL_GROUP_LIB[13122][layer_id][layer_position][1], size );
    return PcGroupCode( SMALL_GROUP_LIB[4374][i], size );
end;

# Method for selecting a subset of the groups which have a given list of properties, i.e. IsAbelian, IsNilpotent
SELECT_SMALL_GROUPS_FUNCS[ pos_3_7_2 ] := SELECT_SMALL_GROUPS_FUNCS[ 11 ];


# Method for SmallGroupsInformation(size):
SMALL_GROUPS_INFORMATION[ pos_3_7_2 ] := function( size, inforec, num )
    Print( " \n");
Print("##################  Groups Information  #########################\n\n");
Print( "There are 24037 groups of order 4374\n\n");
Print( "The nilpotent groups come first sorted by their Sylow 3-subgroup. The non-nilpotent groups are sorted first by their Sylow-3 subgroup and then via the output of the cyclic-split extension algorithm.\n\n");
Print( "1 -  9310 are the nilpotent groups.\n");
Print( "9311 - 24037 are non-nilpotent.\n\n");
Print( "This database was created by David Burrell (2023).\n");
end;
