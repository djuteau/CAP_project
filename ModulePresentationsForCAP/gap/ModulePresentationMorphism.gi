#############################################################################
##
##                                       ModulePresentationsForCAP package
##
##  Copyright 2014, Sebastian Gutsche, TU Kaiserslautern
##                  Sebastian Posur,   RWTH Aachen
##
#############################################################################

DeclareRepresentation( "IsLeftPresentationMorphismRep",
                       IsLeftPresentationMorphism and IsAttributeStoringRep,
                       [ ] );

BindGlobal( "TheFamilyOfLeftPresentationMorphisms",
            NewFamily( "TheFamilyOfLeftPresentationMorphisms" ) );

BindGlobal( "TheTypeOfLeftPresentationMorphisms",
            NewType( TheFamilyOfLeftPresentationMorphisms,
                     IsLeftPresentationMorphismRep ) );


DeclareRepresentation( "IsRightPresentationMorphismRep",
                       IsRightPresentationMorphism and IsAttributeStoringRep,
                       [ ] );

BindGlobal( "TheFamilyOfRightPresentationMorphisms",
            NewFamily( "TheFamilyOfRightPresentationMorphisms" ) );

BindGlobal( "TheTypeOfRightPresentationMorphisms",
            NewType( TheFamilyOfRightPresentationMorphisms,
                     IsRightPresentationMorphismRep ) );

#############################
##
## Constructors
##
#############################

##
InstallMethod( PresentationMorphism,
               [ IsLeftOrRightPresentation, IsHomalgMatrix, IsLeftOrRightPresentation ],
               
  function( source, matrix, range )
    local category, left, morphism, type;
    
    category := CapCategory( source );
    
    left := IsLeftPresentation( source );
    
    if not IsCapCategory( source ) = IsCapCategory( range ) then
      
      Error( "source and range must lie in the same category" );
      
    fi;
    
    if not IsIdenticalObj( UnderlyingHomalgRing( source ), HomalgRing( matrix ) ) then
        
        Error( "matrix can not present a morphism between these objects" );
        
    fi;
    
    if left then
      
      if NrRows( matrix ) <> source!.nr_generators then
          
          Error( "the number of rows of the given matrix is incorrect" );
          
      fi;
      
      if NrColumns( matrix ) <> range!.nr_generators then
        
        Error( "the number of columns of the given matrix is incorrect" );
        
      fi;
      
    else
      
      if NrColumns( matrix ) <> source!.nr_generators then
        
        Error( "the number of columns of the given matrix is incorrect" );
        
      fi;
      
      if NrRows( matrix ) <> range!.nr_generators then
        
        Error( "the number of rows of the given matrix is incorrect" );
        
      fi;
      
    fi;
    
    morphism := rec( );
    
    if left then
        type := TheTypeOfLeftPresentationMorphisms;
    else
        type := TheTypeOfRightPresentationMorphisms;
    fi;
    
    ObjectifyWithAttributes( morphism, type,
                             Source, source,
                             Range, range,
                             UnderlyingHomalgRing, HomalgRing( matrix ),
                             UnderlyingMatrix, matrix );
    
    Add( category, morphism );
    
    return morphism;
    
end );

##############################################
##
## Arithmetics
##
##############################################

##
InstallMethod( \*,
               [ IsRingElement, IsLeftPresentationMorphism ],
               
  function( ring_element, left_presentation )
    
    return PresentationMorphism( Source( left_presentation ),
                                 ring_element * UnderlyingMatrix( left_presentation ),
                                 Range( left_presentation ) );
    
end );

##
InstallMethod( \*,
               [ IsRightPresentationMorphism, IsRingElement ],
               
  function( right_presentation, ring_element )
    
    return PresentationMorphism( Source( right_presentation ),
                                 UnderlyingMatrix( right_presentation ) * ring_element,
                                 Range( right_presentation ) );
    
end );


##############################################
##
## Non categorical methods
##
##############################################

##
InstallMethod( StandardGeneratorMorphism,
               [ IsLeftPresentation, IsPosInt ],
               
  function( module_presentation, i_th_generator )
    local tensor_unit, homalg_ring, number_of_generators, matrix;
    
    number_of_generators := NrColumns( UnderlyingMatrix( module_presentation ) );
    
    if i_th_generator > number_of_generators then
      
      Error( Concatenation( "number of standard generators is ", 
                            String( number_of_generators ), ", which is smaller than ", String( i_th_generator ) ) );
      
    fi;
    
    tensor_unit := TensorUnit( CapCategory( module_presentation ) );
    
    homalg_ring := UnderlyingHomalgRing( tensor_unit );
    
    matrix := List( [ 1 .. number_of_generators ], i -> 0 );
    
    matrix[ i_th_generator ] := 1;
    
    matrix := HomalgMatrix( matrix, 1, number_of_generators, homalg_ring );
    
    return PresentationMorphism( tensor_unit, matrix, module_presentation );
    
end );

##
InstallMethod( StandardGeneratorMorphism,
               [ IsRightPresentation, IsPosInt ],
               
  function( module_presentation, i_th_generator )
    local tensor_unit, homalg_ring, number_of_generators, matrix;
    
    number_of_generators := NrRows( UnderlyingMatrix( module_presentation ) );
    
    if i_th_generator > number_of_generators then
      
      Error( Concatenation( "number of standard generators is ", 
                            String( number_of_generators ), ", which is smaller than ", String( i_th_generator ) ) );
      
    fi;
    
    tensor_unit := TensorUnit( CapCategory( module_presentation ) );
    
    homalg_ring := UnderlyingHomalgRing( tensor_unit );
    
    matrix := List( [ 1 .. number_of_generators ], i -> 0 );
    
    matrix[ i_th_generator ] := 1;
    
    matrix := HomalgMatrix( matrix, number_of_generators, 1, homalg_ring );
    
    return PresentationMorphism( tensor_unit, matrix, module_presentation );
    
end );

##
InstallMethod( CoverByFreeModule,
               [ IsLeftPresentation ],
               
  function( left_presentation )
    local underlying_ring, number_of_generators, free_presentation;
    
    underlying_ring := UnderlyingHomalgRing( left_presentation );
    
    number_of_generators := NrColumns( UnderlyingMatrix( left_presentation ) );
    
    free_presentation := FreeLeftPresentation( number_of_generators, underlying_ring );
    
    return PresentationMorphism( free_presentation, HomalgIdentityMatrix( number_of_generators, underlying_ring ), left_presentation );
    
end );

##
InstallMethod( CoverByFreeModule,
               [ IsRightPresentation ],
               
  function( right_presentation )
    local underlying_ring, number_of_generators, free_presentation;
    
    underlying_ring := UnderlyingHomalgRing( right_presentation );
    
    number_of_generators := NrRows( UnderlyingMatrix( right_presentation ) );
    
    free_presentation := FreeRightPresentation( number_of_generators, underlying_ring );
    
    return PresentationMorphism( free_presentation, HomalgIdentityMatrix( number_of_generators, underlying_ring ), right_presentation );
    
end );

####################################
##
## View
##
####################################

##
InstallMethod( Display,
               [ IsLeftOrRightPresentationMorphism ],
               # FIXME: Fix the rank in GenericView and delete this afterwards
               9999,
               
  function( morphism )
    
    Display( UnderlyingMatrix( morphism ) );
    
    Print( "\n" );
    
    Print( StringMutable( morphism ) );
    
    Print( "\n" );
    
end );

