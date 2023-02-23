#! @Chapter Groups of Order 3^8*2
#! @Section Overview
#!
#! This package gives access to all of the groups of order 3^8*2 through the small groups library. Once the package is loaded the groups of order 3^8*2 may be accessed via <C>SmallGroups(3^8*2,n)</C>.
#!
#! @Section Generation
#! TODO: Describe how these groups were created
#!
#! @Section Ordering
#!
#! TODO: Describe the ordering of these groups
#!

layer_3_8_2 := Length(SMALL_AVAILABLE_FUNCS)+1;

pos_3_8_2:= Maximum(List([
        SMALL_GROUP_FUNCS,
        SMALL_GROUPS_INFORMATION,
        NUMBER_SMALL_GROUPS_FUNCS,
        ID_GROUP_FUNCS,
        SELECT_SMALL_GROUPS_FUNCS,
    ], Length)) + 1;


SMALL_AVAILABLE_FUNCS[layer_3_8_2] := function( size )
    if size = 3^8*2 then
        return rec (
            lib := layer_3_8_2,
            func := pos_3_8_2,
            number := 1897763);
    fi;
    return fail;
end;


ID_AVAILABLE_FUNCS[layer_3_8_2] := function( size )
    return fail;

end;

# Method for SmallGroup(3^8*2,i)
# The groups are stored in separate layers. 
SMALL_GROUP_FUNCS[ pos_3_8_2 ] := function( size, i, inforec )
    local l, j, k, layer_id, layer_position, toRead, split_size_1, split_size_2,layer_change,offset;

    if i > inforec.number then 
        Error("there are just ",inforec.number," groups of order ",size );
    fi;
#the first 22 layers contain 31630 groups
#layers 23-60 contain 31629 groups
#Future Notes: If the size of the layers change then we need only change the following three lines, layer_change is the last layer which has the size of split_size_1, we assume the remaining layers have split_size 2
    split_size_1:=31630; 
    layer_change:=22;
    split_size_2:=31629;
	if QuoInt(i,split_size_1)+1 <= layer_change then
	    layer_id:=QuoInt(i,split_size_1)+1;
	    layer_position:=RemInt(i,split_size_1);

	    if layer_position = 0 then
		layer_position := split_size_1;
	    fi;
	else
	    offset:=(layer_change*split_size_1)-1;
	    layer_id:=QuoInt(i-offset,split_size_2)+1;
	    layer_position:=RemInt(i,split_size_2);

	    if layer_position = 0 then
		layer_position := split_size_2;
	    fi;
	fi;

    if not IsBound( SMALL_GROUP_LIB[ 13122 ] ) then 
        SMALL_GROUP_LIB[ 13122 ] := [];
    fi;

    if not IsBound( SMALL_GROUP_LIB[13122][layer_id] ) then
	toRead:=StringFormatted("gap/ordered/extensions_3_8_2_{}.g",layer_id);
	ReadPackage("GRPS382",toRead);
    fi;


    # return PcGroupCode( SMALL_GROUP_LIB[13122][layer_id][layer_position][1], size );
    return PcGroupCode( SMALL_GROUP_LIB[13122][layer_id][layer_position], size );
end;

# Method for selecting a subset of the groups which have a given list of properties, i.e. IsAbelian, IsNilpotent
SELECT_SMALL_GROUPS_FUNCS[ pos_3_8_2 ] := SELECT_SMALL_GROUPS_FUNCS[ 11 ];


# Method for SmallGroupsInformation(size):
SMALL_GROUPS_INFORMATION[ pos_3_8_2 ] := function( size, inforec, num )
    Print( " \n");
    Print( "This database was created by David Burrell (2022).\n");
end;
