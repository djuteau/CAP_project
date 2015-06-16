#############################################################################
##
##                                               CAP package
##
##  Copyright 2015, Sebastian Gutsche, TU Kaiserslautern
##                  Sebastian Posur,   RWTH Aachen
##
#############################################################################

InstallValue( CATEGORIES_LOGIC_FILES,
              
  rec(
      
      Propositions := rec(
          General := [
                       Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PropositionsForGeneralCategories.tex" )
                     ],
          IsEnrichedOverCommutativeRegularSemigroup := [
                                                         Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PropositionsForCategoriesEnrichedOverCommutativeRegularSemigroups.tex" )
                                                       ],
          IsAbCategory := [
                            Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PropositionsForAbCategories.tex" )
                          ],
          IsAdditiveCategory := [
                                  Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PropositionsForAdditiveCategories.tex" )
                                ],
          IsPreAbelianCategory := [
                                    Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PropositionsForPreabelianCategories.tex" )
                                  ],
          IsAbelianCategory := [
#                                  Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PropositionsForAbelianCategories.tex" )
                               ] ),
      Predicates := rec(
          General := [
                       Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PredicateImplicationsForGeneralCategories.tex" )
                     ],
          IsEnrichedOverCommutativeRegularSemigroup := [
                                                         Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PredicateImplicationsForCategoriesEnrichedOverCommutativeRegularSemigroups.tex" )
                                                       ],
          IsAbCategory := [
                            Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PredicateImplicationsForAbCategories.tex" )
                          ],
          IsAdditiveCategory := [
                                  Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PredicateImplicationsForAdditiveCategories.tex" )
                                ],
          IsPreAbelianCategory := [
                                    Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PredicateImplicationsForPreabelianCategories.tex" )
                                  ],
          IsAbelianCategory := [
                                 Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "PredicateImplicationsForAbelianCategories.tex" )
                               ] ),
      EvalRules := rec(
          General := [
                      Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "RelationsForGeneralCategories.tex" )
                     ],
          IsEnrichedOverCommutativeRegularSemigroup := [
                                                        Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "RelationsForCategoriesEnrichedOverCommutativeRegularSemigroups.tex" )
                                                       ],
          IsAbCategory := [
                           Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "RelationsForAbCategories.tex" )
                          ],
          IsAdditiveCategory := [
                                Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "RelationsForAdditiveCategories.tex" )
                                ],
          IsPreAbelianCategory := [
                                   Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "RelationsForPreabelianCategories.tex" )
                                  ],
          IsAbelianCategory := [
                                Filename( DirectoriesPackageLibrary( "CAP", "LogicForCategories" ), "RelationsForAbelianCategories.tex" )
                               ] ),
     ) );

###################################
##
## Logic part 1: theorems
##
###################################


InstallGlobalFunction( AddTheoremFileToCategory,
                       
  function( category, filename )
    local theorem_list, i;
    
    Add( category!.logical_implication_files.Propositions.General, filename );
    
    theorem_list := READ_THEOREM_FILE( filename );
    
    for i in theorem_list do
        
        ADD_THEOREM_TO_CATEGORY( category, i );
        
    od;
    
end );

InstallGlobalFunction( ADD_THEOREM_TO_CATEGORY,
                       
  function( category, implication_record )
    local theorem_record, name;
    
    theorem_record := TheoremRecord( category );
    
    name := implication_record.Function;
    
    if not IsBound( theorem_record.( name ) ) then
        
        theorem_record.( name ) := [ implication_record ];
        
    else
        
        Add( theorem_record.( name ), implication_record );
        
    fi;
    
end );

InstallGlobalFunction( SANITIZE_RECORD,
                       
  function( record, arguments, result_object )
    local object, index_list, i, value_function, value;
    
    if not IsBound( record!.Object ) then
        
        object := "result";
        
    else
        
        object := record!.Object;
        
    fi;
    
    if IsString( object ) and LowercaseString( object ) = "result" then
        
        object := [ result_object ];
        
    elif IsString( object ) and LowercaseString( object ) = "all" then
        
        object := arguments;
        
    elif IsInt( object ) then
        
        object := [ arguments[ object ] ];
        
    elif IsList( object ) then
        
        index_list := object;
        
        object := [ arguments ];
        
        for i in index_list do
            
            if IsInt( i ) then
                
                object := List( object, j -> j[ i ] );
                
            elif IsString( i ) and LowercaseString( i ) = "all" then
                
                object := Concatenation( object );
                
            else
                
                Error( "wrong object format: only int and all" );
                
            fi;
            
        od;
        
    else
        
        Error( "wrong object type" );
        
    fi;
    
    if IsBound( record!.ValueFunction ) then
        
        value_function := record!.ValueFunction;
        
    else
        
        value_function := IdFunc;
        
    fi;
    
    if IsBound( record!.Value ) then
        
        value := record!.Value;
        
    else
        
        value := true;
        
    fi;
    
    if not IsBound( record!.compare_function ) then
        
        return List( object, i -> [ i, value_function, value ] );
        
    else
        
        return List( object, i -> [ i, value_function, value, record!.compare_function ] );
        
    fi;
    
end );

InstallGlobalFunction( INSTALL_TODO_FOR_LOGICAL_THEOREMS,
                       
  function( arg )
    local method_name, arguments, result_object,
          current_argument, crisp_category, deductive_category, theorem_list,
          current_theorem, todo_list_source, range, is_valid_theorem, sanitized_source,
          entry, current_source, sanitized_source_list, category;
    
    method_name := arg[ 1 ];
    
    arguments := arg[ 2 ];
    
    result_object := arg[ 3 ];
    
    if Length( arg ) = 4 then
        
        category := arg[ 4 ];
        
    else
        
        current_argument := arguments[ 1 ];
        
        if IsCapCategory( current_argument ) then
           
            category := current_argument;
            
        elif IsCapCategoryCell( current_argument ) then
            
            category := CapCategory( current_argument );
            
        elif IsList( current_argument ) then
            
            category := CapCategory( current_argument[ 1 ] );
            
        else
            
            Error( "Cannot figure out which category to use here" );
            
        fi;
        
    fi;
    
    if not IsBound( TheoremRecord( category ).( method_name ) ) then
        
        return;
        
    fi;
    
    theorem_list := TheoremRecord( category ).( method_name );
    
    for current_theorem in theorem_list do
        
        todo_list_source := [ ];
        
        is_valid_theorem := true;
        
        for current_source in current_theorem.Source do
            
            sanitized_source_list := SANITIZE_RECORD( current_source, arguments, result_object );
            
            if IsBound( current_source!.Type ) and LowercaseString( current_source!.Type ) = "testdirect" then
                
                for sanitized_source in sanitized_source_list do
                    
                    if ( Length( sanitized_source ) = 3 and not sanitized_source[ 2 ]( sanitized_source[ 1 ] ) = sanitized_source[ 3 ] )
                       or ( Length( sanitized_source ) = 4 and not sanitized_source[ 4 ]( sanitized_source[ 2 ]( sanitized_source[ 1 ] ), sanitized_source[ 3 ] ) ) then
                        
                        is_valid_theorem := false;
                        
                        break;
                          
                    fi;
                  
                od;
                
            else
                
                for sanitized_source in sanitized_source_list do
                    
                    sanitized_source[ 2 ] := NameFunction( sanitized_source[ 2 ] );
                    
                    Add( todo_list_source, sanitized_source );
                    
                od;
                
            fi;
            
        od;
        
        if is_valid_theorem = false then
            
            continue;
            
        fi;
        
        range := SANITIZE_RECORD( current_theorem!.Range, arguments, result_object );
        
        ## NO ALL ALLOWED HERE!
        range := range[ 1 ];
        
        if Length( todo_list_source ) = 0 then
            
            Setter( range[ 2 ] )( range[ 1 ], range[ 3 ] );
            
            continue;
            
        fi;
        
        entry := ToDoListEntry( todo_list_source, range[ 1 ], NameFunction( range[ 2 ] ), range[ 3 ] );
        
        AddToToDoList( entry );
        
    od;
    
end );

InstallImmediateMethod( CAP_CATEGORY_SOURCE_RANGE_THEOREM_INSTALL_HELPER,
                        IsCapCategoryMorphism and HasCapCategory and HasSource and HasRange,
                        0,
                        
  function( morphism )
    
    INSTALL_TODO_FOR_LOGICAL_THEOREMS( "Source", [ morphism ], Source( morphism ) );
    
    INSTALL_TODO_FOR_LOGICAL_THEOREMS( "Range", [ morphism ], Range( morphism ) );
    
    TryNextMethod();
    
end );

##############################
##
## Logic part 2: predicates
##
##############################

InstallGlobalFunction( AddPredicateImplicationFileToCategory,
                       
  function( category, filename )
    local theorem_list, i;
    
    Add( category!.logical_implication_files.Predicates.General, filename );
    
    theorem_list := READ_PREDICATE_IMPLICATION_FILE( filename );
    
    for i in theorem_list do
        
        ADD_PREDICATE_IMPLICATIONS_TO_CATEGORY( category, i );
        
    od;
    
end );

##
InstallGlobalFunction( ADD_PREDICATE_IMPLICATIONS_TO_CATEGORY,
                       
  function( category, immediate_record )
    
    INSTALL_PREDICATE_IMPLICATION( category, immediate_record );
    
    if not IsBound( category!.predicate_implication ) then
        
        category!.predicate_implication := [ ];
        
    fi;
    
    Add( category!.predicate_implication, immediate_record );
    
end );

##
InstallGlobalFunction( INSTALL_PREDICATE_IMPLICATION,
                       
  function( category, immediate_record )
    local cell_filter;
    
    if LowercaseString( immediate_record!.CellType ) = "obj" then
        
        cell_filter := ObjectFilter( category );
        
    elif LowercaseString( immediate_record!.CellType ) = "mor" then
        
        cell_filter := MorphismFilter( category );
        
    else
        
        cell_filter := TwoCellFilter( category );
        
    fi;
    
    InstallTrueMethod( immediate_record!.Range and cell_filter, immediate_record!.Source and cell_filter );
    
end );

###############################
##
## Technical functions
##
###############################

InstallGlobalFunction( INSTALL_LOGICAL_IMPLICATIONS_HELPER,
                       
  function( category, current_filter )
    local i, theorem_list, current_theorem;
    
    for i in category!.logical_implication_files.Propositions.( current_filter ) do
        
        theorem_list := READ_THEOREM_FILE( i );
        
        for current_theorem in theorem_list do
            
            ADD_THEOREM_TO_CATEGORY( category, current_theorem );
            
        od;
        
    od;
    
    for i in category!.logical_implication_files.Predicates.( current_filter ) do
        
        theorem_list := READ_PREDICATE_IMPLICATION_FILE( i );
        
        for current_theorem in theorem_list do
            
            ADD_PREDICATE_IMPLICATIONS_TO_CATEGORY( category, current_theorem );
            
        od;
        
    od;
    
end );

InstallImmediateMethod( INSTALL_LOGICAL_IMPLICATIONS,
                        IsCapCategory and IsEnrichedOverCommutativeRegularSemigroup,
                        0,
                        
  function( category )
    
    INSTALL_LOGICAL_IMPLICATIONS_HELPER( category, "IsEnrichedOverCommutativeRegularSemigroup" );
    
    TryNextMethod( );
    
end );

InstallImmediateMethod( INSTALL_LOGICAL_IMPLICATIONS,
                        IsCapCategory and IsAdditiveCategory,
                        0,
                        
  function( category )
    
    INSTALL_LOGICAL_IMPLICATIONS_HELPER( category, "IsAdditiveCategory" );
    
    TryNextMethod( );
    
end );

InstallImmediateMethod( INSTALL_LOGICAL_IMPLICATIONS,
                        IsCapCategory and IsPreAbelianCategory,
                        0,
                        
  function( category )
    
    INSTALL_LOGICAL_IMPLICATIONS_HELPER( category, "IsPreAbelianCategory" );
    
    TryNextMethod( );
    
end );

InstallImmediateMethod( INSTALL_LOGICAL_IMPLICATIONS,
                        IsCapCategory and IsAbelianCategory,
                        0,
                        
  function( category )
    
    INSTALL_LOGICAL_IMPLICATIONS_HELPER( category, "IsAbelianCategory" );
    
    TryNextMethod( );
    
end );

InstallImmediateMethod( INSTALL_LOGICAL_IMPLICATIONS,
                        IsCapCategory and IsAbCategory,
                        0,
                        
  function( category )
    
    INSTALL_LOGICAL_IMPLICATIONS_HELPER( category, "IsAbCategory" );
    
    TryNextMethod( );
    
end );

