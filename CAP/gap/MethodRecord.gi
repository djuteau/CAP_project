#############################################################################
##
##                                               CAP package
##
##  Copyright 2015, Sebastian Gutsche, TU Kaiserslautern
##                  Sebastian Posur,   RWTH Aachen
##
#############################################################################

InstallValue( CAP_INTERNAL_METHOD_NAME_RECORD, rec(
LiftAlongMonomorphism := rec(
  installation_name := "LiftAlongMonomorphism",
  filter_list := [ "morphism", "morphism" ],
  io_type := [ [ "iota", "tau" ], [ "tau_source", "iota_source" ] ],
  cache_name := "LiftAlongMonomorphism",
  return_type := "morphism",
  
  post_function := function( alpha, beta, lift )
    
    if lift = fail then
        
        Error( "Mono as kernel lift doesn't exist" );
        
    fi;
    
  end,
  dual_operation := "ColiftAlongEpimorphism" ),

ColiftAlongEpimorphism := rec(
  installation_name := "ColiftAlongEpimorphism",
  filter_list := [ "morphism", "morphism" ],
  io_type := [ [ "epsilon", "tau" ], [ "epsilon_range", "tau_range" ] ],
  cache_name := "ColiftAlongEpimorphism",
  return_type := "morphism",
  post_function := function( alpha, beta, colift )
    
    if colift = fail then
        
        Error( "Epi as cokernel colift doesn't exist" );
        
    fi;
    
  end,
  dual_operation := "LiftAlongMonomorphism" ),

Lift := rec(
  installation_name := "Lift",
  filter_list := [ "morphism", "morphism" ],
  io_type := [ [ "alpha", "beta" ], [ "alpha_source", "beta_source" ] ],
  cache_name := "Lift",
  return_type := "morphism",
  
  post_function := function( alpha, beta, lift )
    
    if lift = fail then
        
        Error( "Lift doesn't exist" );
        
    fi;
    
  end,
  dual_operation := "Colift" ),

Colift := rec(
  installation_name := "Colift",
  filter_list := [ "morphism", "morphism" ],
  io_type := [ [ "alpha", "beta" ], [ "alpha_range", "beta_range" ] ],
  cache_name := "Colift",
  return_type := "morphism",
  post_function := function( alpha, beta, colift )
    
    if colift = fail then
        
        Error( "Colift doesn't exist" );
        
    fi;
    
  end,
  dual_operation := "Lift" ),

IdentityMorphism := rec(
  installation_name := "IdentityMorphism",
  filter_list := [ "object" ],
  io_type := [ [ "a" ], [ "a", "a" ] ],
  return_type := "morphism" ),

InverseImmutable := rec(
# Type check for IsIsomorphism
  installation_name := "InverseOp",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "alpha_range", "alpha_source" ] ],
  return_type := "morphism" ),

KernelObject := rec(
  installation_name := "KernelObject",
  filter_list := [ "morphism" ],
  universal_type := "Limit",
  return_type := "object",
  dual_operation := "CokernelObject" ),

KernelEmbedding := rec(
  installation_name := "KernelEmbedding",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "K", "alpha_source" ] ],
  universal_object_position := "Source",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "CokernelProjection" ),

KernelEmbeddingWithGivenKernelObject := rec(
  installation_name := "KernelEmbeddingWithGivenKernelObject",
  filter_list := [ "morphism", "object" ],
  io_type := [ [ "alpha", "K" ], [ "K", "alpha_source" ] ],
  cache_name := "KernelEmbeddingWithGivenKernelObject",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "CokernelProjectionWithGivenCokernelObject"),

KernelLift := rec(
  installation_name := "KernelLift",
  filter_list := [ "morphism", "morphism" ],
  io_type := [ [ "alpha", "tau" ], [ "tau_source", "K" ] ],
  cache_name := "KernelLift",
  universal_object_position := "Range",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "CokernelColift" ),

KernelLiftWithGivenKernelObject := rec(
  installation_name := "KernelLiftWithGivenKernelObject",
  filter_list := [ "morphism", "morphism", "object" ],
  io_type := [ [ "alpha", "tau", "K" ], [ "tau_source", "K" ] ],
  cache_name := "KernelLiftWithGivenKernelObject",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "CokernelColiftWithGivenCokernelObject" ),

CokernelObject := rec(
  installation_name := "CokernelObject",
  filter_list := [ "morphism" ],
  universal_type := "Colimit",
  return_type := "object",
  dual_operation := "KernelObject" ),

CokernelProjection := rec(
  installation_name := "CokernelProjection",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "alpha_range", "K" ] ],
  universal_object_position := "Range",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "KernelEmbedding" ),

CokernelProjectionWithGivenCokernelObject := rec(
  installation_name := "CokernelProjectionWithGivenCokernelObject",
  filter_list := [ "morphism", "object" ],
  io_type := [ [ "alpha", "K" ], [ "alpha_range", "K" ] ],
  cache_name := "CokernelProjectionWithGivenCokernelObject",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "KernelEmbeddingWithGivenKernelObject" ),

CokernelColift := rec(
  installation_name := "CokernelColift",
  filter_list := [ "morphism", "morphism" ],
  io_type := [ [ "alpha", "tau" ], [ "K", "tau_range" ] ],
  cache_name := "CokernelColift",
  universal_object_position := "Source",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "KernelLift" ),

CokernelColiftWithGivenCokernelObject := rec(
  installation_name := "CokernelColiftWithGivenCokernelObject",
  filter_list := [ "morphism", "morphism", "object" ],
  io_type := [ [ "alpha", "tau", "K" ], [ "K", "tau_range" ] ],
  cache_name := "CokernelColiftWithGivenCokernelObject",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "KernelLiftWithGivenKernelObject" ),

PreCompose := rec(
  installation_name := "PreCompose",
  filter_list := [ "morphism", "morphism" ],
  io_type := [ [ "alpha", "beta" ], [ "alpha_source", "beta_range" ] ],
  cache_name := "PreCompose",
  
  pre_function := function( mor_left, mor_right )
    local is_equal_for_objects;
    
    is_equal_for_objects := IsEqualForObjects( Range( mor_left ), Source( mor_right ) );
    
    if is_equal_for_objects = fail then
      
      return [ false, "cannot decide whether morphisms are composable" ];
      
    elif is_equal_for_objects = false then
        
        return [ false, "morphisms not composable" ];
        
    fi;
    
    return [ true ];
  end,
  return_type := "morphism",
  dual_operation := "PostCompose" ),

PostCompose := rec(
  installation_name := "PostCompose",
  filter_list := [ "morphism", "morphism" ],
  io_type := [ [ "beta", "alpha" ], [ "alpha_source", "beta_range" ] ],
  cache_name := "PostCompose",
  
  pre_function := function( mor_right, mor_left )
    local is_equal_for_objects;
    
    is_equal_for_objects := IsEqualForObjects( Range( mor_left ), Source( mor_right ) );
    
    if is_equal_for_objects = fail then
      
      return [ false, "cannot decide whether morphisms are composable" ];
      
    elif is_equal_for_objects = false then
        
        return [ false, "morphisms not composable" ];
        
    fi;
    
    return [ true ];
  end,
  
  return_type := "morphism",
  dual_operation := "PreCompose" ),

ZeroObject := rec(
  installation_name := "ZeroObject",
  filter_list := [ "category" ],
  cache_name := "ZeroObject",
  return_type := "object" ), 

UniversalMorphismFromZeroObject := rec(
  installation_name := "UniversalMorphismFromZeroObject",
  filter_list := [ "object" ],
  io_type := [ [ "A" ], [ "Z", "A" ] ],
  universal_object_position := "Source",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "UniversalMorphismIntoZeroObject",
  
  ## this redirect and this post function have to be given manually, because
  ## they call the setter and getter functions of CapCategory( diagram ), and 
  ## not of diagram.
  redirect_function := function( test_sink )
    local category;
    
    category := CapCategory( test_sink );
    
    if HasZeroObject( category ) then
      
      return [ true, UniversalMorphismFromZeroObjectWithGivenZeroObject( test_sink, ZeroObject( category ) ) ];
      
    fi;
    
    return [ false ];
    
  end,
  
  post_function := function( test_sink, universal_morphism )
    local category, zero_object;
    
    category := CapCategory( test_sink );
    
    zero_object := Source( universal_morphism );
    
    SetZeroObject( category, zero_object );
    
    SetFilterObj( zero_object, WasCreatedAsZeroObject );
    
  end ),
  
UniversalMorphismFromZeroObjectWithGivenZeroObject := rec(
  installation_name := "UniversalMorphismFromZeroObjectWithGivenZeroObject",
  filter_list := [ "object", "object" ],
  io_type := [ [ "A", "Z" ], [ "Z", "A" ] ],
  cache_name := "UniversalMorphismFromZeroObjectWithGivenZeroObject",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "UniversalMorphismIntoZeroObjectWithGivenZeroObject" ),

UniversalMorphismIntoZeroObject := rec(
  installation_name := "UniversalMorphismIntoZeroObject",
  filter_list := [ "object" ],
  io_type := [ [ "A" ], [ "A", "Z" ] ],
  universal_object_position := "Range",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "UniversalMorphismFromZeroObject",
  
  ## this redirect and this post function have to be given manually, because
  ## they call the setter and getter functions of CapCategory( diagram ), and 
  ## not of diagram.
  redirect_function := function( test_source )
    local category;
    
    category := CapCategory( test_source );
        
    if HasZeroObject( category ) then
    
      return [ true, UniversalMorphismIntoZeroObjectWithGivenZeroObject( test_source, ZeroObject( category ) ) ];
      
    fi;
    
    return [ false ];
    
  end,

  post_function := function( test_source, universal_morphism )
    local category, zero_object;
    
    category := CapCategory( test_source );
    
    zero_object := Range( universal_morphism );
    
    SetZeroObject( category, zero_object );
    
    SetFilterObj( zero_object, WasCreatedAsTerminalObject );
    
  end ),

UniversalMorphismIntoZeroObjectWithGivenZeroObject := rec(
  installation_name := "UniversalMorphismIntoZeroObjectWithGivenZeroObject",
  filter_list := [ "object", "object" ],
  io_type := [ [ "A", "Z" ], [ "A", "Z" ] ],
  cache_name := "UniversalMorphismIntoZeroObjectWithGivenZeroObject",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "UniversalMorphismFromZeroObjectWithGivenZeroObject" ),

IsomorphismFromZeroObjectToInitialObject := rec(
  installation_name := "IsomorphismFromZeroObjectToInitialObject",
  filter_list := [ "category" ],
  ## TODO: io_type?
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromZeroObjectToInitialObject",
  return_type := "morphism",
  dual_operation := "IsomorphismFromTerminalObjectToZeroObject" ),

IsomorphismFromInitialObjectToZeroObject := rec(
  installation_name := "IsomorphismFromInitialObjectToZeroObject",
  filter_list := [ "category" ],
  ## TODO: io_type?
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromInitialObjectToZeroObject",
  return_type := "morphism",
  dual_operation := "IsomorphismFromZeroObjectToTerminalObject" ),

IsomorphismFromZeroObjectToTerminalObject := rec(
  installation_name := "IsomorphismFromZeroObjectToTerminalObject",
  filter_list := [ "category" ],
  ## TODO: io_type?
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromZeroObjectToTerminalObject",
  return_type := "morphism",
  dual_operation := "IsomorphismFromInitialObjectToZeroObject" ),

IsomorphismFromTerminalObjectToZeroObject := rec(
  installation_name := "IsomorphismFromTerminalObjectToZeroObject",
  filter_list := [ "category" ],
  ## TODO: io_type?
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromTerminalObjectToZeroObject",
  return_type := "morphism",
  dual_operation := "IsomorphismFromZeroObjectToInitialObject" ),

ZeroMorphism := rec(
  installation_name := "ZeroMorphism",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "b" ], [ "a", "b" ] ],
  cache_name := "ZeroMorphism",
  return_type := "morphism" ),

DirectSum := rec(
  installation_name := "DirectSumOp",
  filter_list := [ IsList, "object" ],
  argument_list := [ 1 ],
  cache_name := "DirectSumOp",
  universal_type := "LimitColimit",
  return_type := "object",
  pre_function := function( diagram, selection_morphism )
      local category;
      
      category := CapCategory( selection_morphism );
      
      if not ForAll( diagram, i -> IsIdenticalObj( category, CapCategory( i ) ) ) then
          
          return [ false, "not all given objects lie in the same category" ];
          
      elif not ForAll( diagram, IsCapCategoryObject ) then
          
          return [ false, "not all elements of diagram are objects" ];
          
      fi;
      
      return [ true ];
      
  end ),

ProjectionInFactorOfDirectSum := rec(
  installation_name := "ProjectionInFactorOfDirectSumOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsInt, "object" ],
  io_type := [ [ "D", "k" ], [ "S", "D_k" ] ],
  cache_name := "ProjectionInFactorOfDirectSumOp",
  universal_object_position := "Source",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "InjectionOfCofactorOfDirectSum" ),

ProjectionInFactorOfDirectSumWithGivenDirectSum := rec(
  installation_name := "ProjectionInFactorOfDirectSumWithGivenDirectSum",
  filter_list := [ IsList, IsInt, "object" ],
  io_type := [ [ "D", "k", "S" ], [ "S", "D_k" ] ],
  cache_name := "ProjectionInFactorOfDirectSumWithGivenDirectSum",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "InjectionOfCofactorOfDirectSumWithGivenDirectSum" ),

UniversalMorphismIntoDirectSum := rec(
  installation_name := "UniversalMorphismIntoDirectSumOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsList, "object" ],
  io_type := [ [ "D", "tau" ], [ "tau_1_source", "S" ] ],
  cache_name := "UniversalMorphismIntoDirectSumOp",
  universal_object_position := "Range",
  universal_type := "Limit",
  dual_operation := "UniversalMorphismFromDirectSum",
  
  pre_function := function( diagram, source, method_selection_object )
    local test_object, current_morphism, current_return;
    
    test_object := Source( source[1] );
    
    for current_morphism in source{[2 .. Length( source ) ]} do
        
        current_return := IsEqualForObjects( Source( current_morphism ), test_object );
        
        if current_return = fail then
            
            return [ false, "cannot decide whether sources of morphisms in given source diagram are equal" ];
            
        elif current_return = false then
            
            return [ false, "sources of morphisms must be equal in given source diagram" ];
            
        fi;
        
    od;
    
    return [ true ];
    
  end,
  return_type := "morphism" ),

UniversalMorphismIntoDirectSumWithGivenDirectSum := rec(
  installation_name := "UniversalMorphismIntoDirectSumWithGivenDirectSum",
  filter_list := [ IsList, IsList, "object" ],
  io_type := [ [ "D", "tau", "S" ], [ "tau_1_source", "S" ] ],
  cache_name := "UniversalMorphismIntoDirectSumWithGivenDirectSum",
  universal_type := "Limit",
  dual_operation := "UniversalMorphismFromDirectSumWithGivenDirectSum",
  
  pre_function := function( diagram, source, direct_sum )
    local test_object, current_morphism, current_return;
    
    test_object := Source( source[1] );
    
    for current_morphism in source{[2 .. Length( source ) ]} do
        
        current_return := IsEqualForObjects( Source( current_morphism ), test_object );
        
        if current_return = fail then
            
            return [ false, "cannot decide whether sources of morphisms in given source diagram are equal" ];
            
        elif current_return = false then
            
            return [ false, "sources of morphisms must be equal in given source diagram" ];
            
        fi;
        
    od;
    
    return [ true ];
    
  end,
  return_type := "morphism" ),

InjectionOfCofactorOfDirectSum := rec(
  installation_name := "InjectionOfCofactorOfDirectSumOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsInt, "object" ],
  io_type := [ [ "D", "k" ], [ "D_k", "S" ] ],
  cache_name := "InjectionOfCofactorOfDirectSumOp",
  universal_object_position := "Range",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "ProjectionInFactorOfDirectSum" ),

InjectionOfCofactorOfDirectSumWithGivenDirectSum := rec(
  installation_name := "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
  filter_list := [ IsList, IsInt, "object" ],
  io_type := [ [ "D", "k", "S" ], [ "D_k", "S" ] ],
  cache_name := "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "ProjectionInFactorOfDirectSumWithGivenDirectSum" ),

UniversalMorphismFromDirectSum := rec(
  installation_name := "UniversalMorphismFromDirectSumOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsList, "object" ],
  io_type := [ [ "D", "tau" ], [ "S", "tau_1_range" ] ],
  cache_name := "UniversalMorphismFromDirectSumOp",
  universal_object_position := "Source",
  universal_type := "Colimit",
  dual_operation := "UniversalMorphismIntoDirectSum",
  
  pre_function := function( diagram, sink, method_selection_object )
    local test_object, current_morphism, current_return;
    
    test_object := Range( sink[1] );
    
    for current_morphism in sink{[2 .. Length( sink ) ]} do
        
        current_return := IsEqualForObjects( Range( current_morphism ), test_object );
        
        if current_return = fail then
            
            return [ false, "cannot decide whether ranges of morphisms in given sink diagram are equal" ];
            
        elif current_return = false then
            
            return [ false, "ranges of morphisms must be equal in given sink diagram" ];
            
        fi;
        
    od;
    
    return [ true ];
    
  end,
  return_type := "morphism" ),

UniversalMorphismFromDirectSumWithGivenDirectSum := rec(
  installation_name := "UniversalMorphismFromDirectSumWithGivenDirectSum",
  filter_list := [ IsList, IsList, "object" ],
  io_type := [ [ "D", "tau", "S" ], [ "S", "tau_1_range" ] ],
  cache_name := "UniversalMorphismFromDirectSumWithGivenDirectSum",
  universal_type := "Colimit",
  dual_operation := "UniversalMorphismIntoDirectSumWithGivenDirectSum",
  
  pre_function := function( diagram, sink, direct_sum )
    local test_object, current_morphism, current_return;
    
    test_object := Range( sink[1] );
    
    for current_morphism in sink{[2 .. Length( sink ) ]} do
        
        current_return := IsEqualForObjects( Range( current_morphism ), test_object );
        
        if current_return = fail then
            
            return [ false, "cannot decide whether ranges of morphisms in given sink diagram are equal" ];
            
        elif current_return = false then
            
            return [ false, "ranges of morphisms must be equal in given sink diagram" ];
            
        fi;
        
    od;
    
    return [ true ];
    
  end,
  return_type := "morphism" ),

TerminalObject := rec(
  installation_name := "TerminalObject",
  filter_list := [ "category" ],
  cache_name := "TerminalObject",
  universal_type := "Limit",
  return_type := "object",
  dual_operation := "InitialObject" ),

UniversalMorphismIntoTerminalObject := rec(
  installation_name := "UniversalMorphismIntoTerminalObject",
  filter_list := [ "object" ],
  io_type := [ [ "A" ], [ "A", "T" ] ],
  universal_object_position := "Range",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "UniversalMorphismFromInitialObject",
  
  ## this redirect and this post function have to be given manually, because
  ## they call the setter and getter functions of CapCategory( diagram ), and 
  ## not of diagram.
  redirect_function := function( test_source )
    local category;
    
    category := CapCategory( test_source );
        
    if HasTerminalObject( category ) then
    
      return [ true, UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( test_source, TerminalObject( category ) ) ];
      
    fi;
    
    return [ false ];
    
  end,

  post_function := function( test_source, universal_morphism )
    local category, terminal_object;
    
    category := CapCategory( test_source );
    
    terminal_object := Range( universal_morphism );
    
    SetTerminalObject( category, terminal_object );
    
    SetFilterObj( terminal_object, WasCreatedAsTerminalObject );
    
  end ),

UniversalMorphismIntoTerminalObjectWithGivenTerminalObject := rec(
  installation_name := "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject",
  filter_list := [ "object", "object" ],
  io_type := [ [ "A", "T" ], [ "A", "T" ] ],
  cache_name := "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "UniversalMorphismFromInitialObjectWithGivenInitialObject" ),

InitialObject := rec(
  installation_name := "InitialObject",
  filter_list := [ "category" ],
  cache_name := "InitialObject",
  universal_type := "Colimit",
  return_type := "object",
  dual_operation := "TerminalObject"
),

UniversalMorphismFromInitialObject := rec(
  installation_name := "UniversalMorphismFromInitialObject",
  filter_list := [ "object" ],
  io_type := [ [ "A" ], [ "I", "A" ] ],
  universal_object_position := "Source",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "UniversalMorphismIntoTerminalObject",
  
  ## this redirect and this post function have to be given manually, because
  ## they call the setter and getter functions of CapCategory( diagram ), and 
  ## not of diagram.
  redirect_function := function( test_sink )
    local category;
    
    category := CapCategory( test_sink );
    
    if HasInitialObject( category ) then
      
      return [ true, UniversalMorphismFromInitialObjectWithGivenInitialObject( test_sink, InitialObject( category ) ) ];
      
    fi;
    
    return [ false ];
    
  end,
  
  post_function := function( test_sink, universal_morphism )
    local category, initial_object;
    
    category := CapCategory( test_sink );
    
    initial_object := Source( universal_morphism );
    
    SetInitialObject( category, initial_object );
    
    SetFilterObj( initial_object, WasCreatedAsInitialObject );
    
  end ),

UniversalMorphismFromInitialObjectWithGivenInitialObject := rec(
  installation_name := "UniversalMorphismFromInitialObjectWithGivenInitialObject",
  filter_list := [ "object", "object" ],
  io_type := [ [ "I", "A" ], [ "I", "A" ] ],
  cache_name := "UniversalMorphismFromInitialObjectWithGivenInitialObject",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject" ),

DirectProduct := rec(
  installation_name := "DirectProductOp",
  argument_list := [ 1 ],
  filter_list := [ IsList, "object" ],
  cache_name := "DirectProductOp",
  universal_type := "Limit",
  return_type := "object",
  dual_operation := "Coproduct",
  pre_function := function( diagram, selection_morphism )
      local category;
      
      category := CapCategory( selection_morphism );
      
      if not ForAll( diagram, i -> IsIdenticalObj( category, CapCategory( i ) ) ) then
          
          return [ false, "not all given objects lie in the same category" ];
          
      elif not ForAll( diagram, IsCapCategoryObject ) then
          
          return [ false, "not all elements of diagram are objects" ];
          
      fi;
      
      return [ true ];
      
  end ),

ProjectionInFactorOfDirectProduct := rec(
  installation_name := "ProjectionInFactorOfDirectProductOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsInt, "object" ],
  io_type := [ [ "D", "k" ], [ "P", "D_k" ] ],
  cache_name := "ProjectionInFactorOfDirectProductOp",
  universal_object_position := "Source",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "InjectionOfCofactorOfCoproduct" ),

ProjectionInFactorOfDirectProductWithGivenDirectProduct := rec(
  installation_name := "ProjectionInFactorOfDirectProductWithGivenDirectProduct",
  filter_list := [ IsList, IsInt, "object" ],
  io_type := [ [ "D", "k", "P" ], [ "P", "D_k" ] ],
  cache_name := "ProjectionInFactorOfDirectProductWithGivenDirectProduct",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "InjectionOfCofactorOfCoproductWithGivenCoproduct" ),

UniversalMorphismIntoDirectProduct := rec(
  installation_name := "UniversalMorphismIntoDirectProductOp",
  argument_list := [ 1, 2 ],
  io_type := [ [ "D", "tau" ], [ "tau_1_source", "P" ] ],
  filter_list := [ IsList, IsList, "object" ],
  cache_name := "UniversalMorphismIntoDirectProductOp",
  universal_object_position := "Range",
  universal_type := "Limit",
  dual_operation := "UniversalMorphismFromCoproduct",
  
  pre_function := function( diagram, source, method_selection_object )
    local test_object, current_morphism, current_return;
    
    test_object := Source( source[1] );
    
    for current_morphism in source{[2 .. Length( source ) ]} do
        
        current_return := IsEqualForObjects( Source( current_morphism ), test_object );
        
        if current_return = fail then
            
            return [ false, "cannot decide whether sources of morphisms in given source diagram are equal" ];
            
        elif current_return = false then
            
            return [ false, "sources of morphisms must be equal in given source diagram" ];
            
        fi;
        
    od;
    
    return [ true ];
    
  end,
  return_type := "morphism" ),

UniversalMorphismIntoDirectProductWithGivenDirectProduct := rec(
  installation_name := "UniversalMorphismIntoDirectProductWithGivenDirectProduct",
  filter_list := [ IsList, IsList, "object" ],
  io_type := [ [ "D", "tau", "P" ], [ "tau_1_source", "P" ] ],
  cache_name := "UniversalMorphismIntoDirectProductWithGivenDirectProduct",
  universal_type := "Limit",
  dual_operation := "UniversalMorphismFromCoproductWithGivenCoproduct",
  
  pre_function := function( diagram, source, direct_product )
    local test_object, current_morphism, current_return;
    
    test_object := Source( source[1] );
    
    for current_morphism in source{[2 .. Length( source ) ]} do
        
        current_return := IsEqualForObjects( Source( current_morphism ), test_object );
        
        if current_return = fail then
            
            return [ false, "cannot decide whether sources of morphisms in given source diagram are equal" ];
            
        elif current_return = false then
            
            return [ false, "sources of morphisms must be equal in given source diagram" ];
            
        fi;
        
    od;
    
    return [ true ];
    
  end,
  return_type := "morphism" ),

IsCongruentForMorphisms := rec(
  installation_name := "IsCongruentForMorphisms",
  filter_list := [ "morphism", "morphism" ],
  cache_name := "IsCongruentForMorphisms",
  well_defined_todo := false,
  
  pre_function := function( morphism_1, morphism_2 )
    local value_1, value_2;
    
    value_1 := IsEqualForObjects( Source( morphism_1 ), Source( morphism_2 ) );
    
    if value_1 = fail then
      
      return [ false, "cannot decide whether sources are equal" ];
      
    fi;
    
    value_2 := IsEqualForObjects( Range( morphism_1 ), Range( morphism_2 ) );
    
    if value_2 = fail then
      
      return [ false, "cannot decide whether ranges are equal" ];
      
    fi;
    
    
    if value_1 and value_2 then
        
        return [ true ];
        
    elif value_1 then
        
        return [ false, "ranges are not equal" ];
        
    else
        
        return [ false, "sources are not equal" ];
        
    fi;
    
  end,
  
  redirect_function := function( morphism_1, morphism_2 )
    
    if IsIdenticalObj( morphism_1, morphism_2 ) then 
      
      return [ true, true ];
      
    else
      
      return [ false ];
      
    fi;
    
  end,
  
  post_function := function( morphism_1, morphism_2, return_value )
    
    if return_value = true then
      
      INSTALL_TODO_LIST_FOR_EQUAL_MORPHISMS( morphism_1, morphism_2 );
    
    fi;
    
  end,
  
  return_type := "bool" ),

IsEqualForMorphisms := rec(
  installation_name := "IsEqualForMorphisms",
  filter_list := [ "morphism", "morphism" ],
  cache_name := "IsEqualForMorphisms",
  well_defined_todo := false,
  
  pre_function := function( morphism_1, morphism_2 )
    local value_1, value_2;
    
    value_1 := IsEqualForObjects( Source( morphism_1 ), Source( morphism_2 ) );
    
    if value_1 = fail then
      
      return [ false, "cannot decide whether sources are equal" ];
      
    fi;
    
    value_2 := IsEqualForObjects( Range( morphism_1 ), Range( morphism_2 ) );
    
    if value_2 = fail then
      
      return [ false, "cannot decide whether ranges are equal" ];
      
    fi;
    
    
    if value_1 and value_2 then
        
        return [ true ];
        
    elif value_1 then
        
        return [ false, "ranges are not equal" ];
        
    else
        
        return [ false, "sources are not equal" ];
        
    fi;
    
  end,
  
  redirect_function := function( morphism_1, morphism_2 )
    
    if IsIdenticalObj( morphism_1, morphism_2 ) then 
      
      return [ true, true ];
      
    else
      
      return [ false ];
      
    fi;
    
  end,
  
  return_type := "bool" ),

IsEqualForMorphismsOnMor := rec(
  installation_name := "IsEqualForMorphismsOnMor",
  filter_list := [ "morphism", "morphism" ],
  cache_name := "IsEqualForMorphismsOnMor",
  well_defined_todo := false,
  
  redirect_function := function( morphism_1, morphism_2 )
    
    if IsIdenticalObj( morphism_1, morphism_2 ) then 
      
      return [ true, true ];
      
    else
      
      return [ false ];
      
    fi;
    
  end,
  
  return_type := "bool" ),

IsEqualForObjects := rec(
  installation_name := "IsEqualForObjects",
  filter_list := [ "object", "object" ],
  cache_name := "IsEqualForObjects",
  well_defined_todo := false,
  
  redirect_function := function( object_1, object_2 )
    
    if IsIdenticalObj( object_1, object_2 ) then
      
      return [ true, true ];
      
    else
      
      return [ false ];
      
    fi;
    
  end,
  
  post_function := function( object_1, object_2, return_value )
    
    if return_value = true and not IsIdenticalObj( object_1, object_2 ) then
        
        INSTALL_TODO_LIST_FOR_EQUAL_OBJECTS( object_1, object_2 );
        
    fi;
    
  end,
  
  return_type := "bool" ),
  
IsEqualForCacheForObjects := rec(
  installation_name := "IsEqualForCache",
  filter_list := [ "object", "object" ],
  cache_name := "IsEqualForCacheForObjects",
  well_defined_todo := false,
  return_type := "bool" ),

IsEqualForCacheForMorphisms := rec(
  installation_name := "IsEqualForCache",
  filter_list := [ "morphism", "morphism" ],
  cache_name := "IsEqualForCacheForMorphisms",
  well_defined_todo := false,
  return_type := "bool" ),
  
IsZeroForMorphisms := rec(
  installation_name := "IsZero",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  property_of := "morphism",
  is_reflected_by_faithful_functor := true ),

AdditionForMorphisms := rec(
  installation_name := "\+",
  filter_list := [ "morphism", "morphism" ],
  io_type := [ [ "a" ], [ "a_source", "a_range" ] ],
  cache_name := "AdditionForMorphisms",
  
  pre_function := function( morphism_1, morphism_2 )
    local value_1, value_2;
    
    value_1 := IsEqualForObjects( Source( morphism_1 ), Source( morphism_2 ) );
    
    if value_1 = fail then
      
      return [ false, "cannot decide whether sources are equal" ];
      
    fi;
    
    value_2 := IsEqualForObjects( Range( morphism_1 ), Range( morphism_2 ) );
    
    if value_2 = fail then
      
      return [ false, "cannot decide whether ranges are equal" ];
      
    fi;
    
    
    if value_1 and value_2 then
        
        return [ true ];
        
    elif value_1 then
        
        return [ false, "ranges are not equal" ];
        
    else
        
        return [ false, "sources are not equal" ];
        
    fi;
    
  end,
  return_type := "morphism" ),

AdditiveInverseForMorphisms := rec(
  installation_name := "AdditiveInverse",
  filter_list := [ "morphism" ],
  io_type := [ [ "a" ], [ "a_source", "a_range" ] ],
  return_type := "morphism" ),

Coproduct := rec(
  installation_name := "CoproductOp",
  argument_list := [ 1 ],
  filter_list := [ IsList, "object" ],
  cache_name := "CoproductOp",
  universal_type := "Colimit",
  return_type := "object",
  dual_operation := "DirectProduct" ),

InjectionOfCofactorOfCoproduct := rec(
  installation_name := "InjectionOfCofactorOfCoproductOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsInt, "object" ],
  io_type := [ [ "D", "k" ], [ "D_k", "I" ] ],
  cache_name := "InjectionOfCofactorOfCoproductOp",
  universal_object_position := "Range",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "ProjectionInFactorOfDirectProduct" ),

InjectionOfCofactorOfCoproductWithGivenCoproduct := rec(
  installation_name := "InjectionOfCofactorOfCoproductWithGivenCoproduct",
  filter_list := [ IsList, IsInt, "object" ],
  io_type := [ [ "D", "k", "I" ], [ "D_k", "I" ] ],
  cache_name := "InjectionOfCofactorOfCoproductWithGivenCoproduct",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "ProjectionInFactorOfDirectProductWithGivenDirectProduct" ),

UniversalMorphismFromCoproduct := rec(
  installation_name := "UniversalMorphismFromCoproductOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsList, "object" ],
  io_type := [ [ "D", "tau" ], [ "I", "tau_1_range" ] ],
  cache_name := "UniversalMorphismFromCoproductOp",
  universal_object_position := "Source",
  universal_type := "Colimit",
  dual_operation := "UniversalMorphismIntoDirectProduct",
  
  pre_function := function( diagram, sink, method_selection_object )
    local test_object, current_morphism, current_return;
    
    test_object := Range( sink[1] );
    
    for current_morphism in sink{[2 .. Length( sink ) ]} do
        
        current_return := IsEqualForObjects( Range( current_morphism ), test_object );
        
        if current_return = fail then
            
            return [ false, "cannot decide whether ranges of morphisms in given sink diagram are equal" ];
            
        elif current_return = false then
            
            return [ false, "ranges of morphisms must be equal in given sink diagram" ];
            
        fi;
        
    od;
    
    return [ true ];
    
  end,
  return_type := "morphism" ),

UniversalMorphismFromCoproductWithGivenCoproduct := rec(
  installation_name := "UniversalMorphismFromCoproductWithGivenCoproduct",
  filter_list := [ IsList, IsList, "object" ],
  io_type := [ [ "D", "tau", "I" ], [ "I", "tau_1_range" ] ],
  cache_name := "UniversalMorphismFromCoproductWithGivenCoproduct",
  universal_type := "Colimit",
  dual_operation := "UniversalMorphismIntoDirectProductWithGivenDirectProduct",
  
  pre_function := function( diagram, sink, coproduct )
    local test_object, current_morphism, current_return;
    
    test_object := Range( sink[1] );
    
    for current_morphism in sink{[2 .. Length( sink ) ]} do
        
        current_return := IsEqualForObjects( Range( current_morphism ), test_object );
        
        if current_return = fail then
            
            return [ false, "cannot decide whether ranges of morphisms in given sink diagram are equal" ];
            
        elif current_return = false then
            
            return [ false, "ranges of morphisms must be equal in given sink diagram" ];
            
        fi;
        
    od;
    
    return [ true ];
    
  end,
  return_type := "morphism" ),

IsEqualAsSubobjects := rec(
  installation_name := "IsEqualAsSubobjects",
  filter_list := [ [ "morphism", IsSubobject ], [ "morphism", IsSubobject ] ],
  cache_name := "IsEqualAsSubobjects",
  well_defined_todo := false,
  return_type := "bool",
  dual_operation := "IsEqualAsFactorobjects" ),

IsEqualAsFactorobjects := rec(
  installation_name := "IsEqualAsFactorobjects",
  filter_list := [ [ "morphism", IsFactorobject ], [ "morphism", IsFactorobject ] ],
  cache_name := "IsEqualAsFactorobjects",
  well_defined_todo := false,
  return_type := "bool",
  dual_operation := "IsEqualAsSubobjects" ),

Dominates := rec(
  installation_name := "Dominates",
  filter_list := [ [ "morphism", IsSubobject ], [ "morphism", IsSubobject ] ],
  cache_name := "Dominates",
  well_defined_todo := false,
  dual_operation := "Codominates",
  
  pre_function := function( sub1, sub2 )
    local is_equal_for_objects;
    
    is_equal_for_objects := IsEqualForObjects( Range( sub1 ), Range( sub2 ) );
    
    if is_equal_for_objects = fail then
        
        return [ false, "cannot decide whether those are subobjects of the same object" ];
    
    elif is_equal_for_objects = false then
        
        return [ false, "subobjects of different objects are not comparable by dominates" ];
        
    fi;
    
    return [ true ];
  end,
  return_type := "bool" ),

Codominates := rec(
  installation_name := "Codominates",
  filter_list := [ [ "morphism", IsFactorobject ], [ "morphism", IsFactorobject ] ],
  cache_name := "Codominates",
  well_defined_todo := false,
  dual_operation := "Dominates",
  
  pre_function := function( factor1, factor2 )
    local is_equal_for_objects;
    
    is_equal_for_objects := IsEqualForObjects( Source( factor1 ), Source( factor2 ) );
    
    if is_equal_for_objects = fail then
        
        return [ false, "cannot decide whether those are factors of the same object" ];
    
    elif is_equal_for_objects = false then
        
        return [ false, "factors of different objects are not comparable by codominates" ];
        
    fi;
    
    return [ true ];
  end,
  return_type := "bool" ),

FiberProduct := rec(
  installation_name := "FiberProductOp",
  argument_list := [ 1 ],
  filter_list := [ IsList, "morphism" ],
  cache_name := "FiberProductOp",
  universal_type := "Limit",
  dual_operation := "Pushout",
  
  pre_function := function( diagram, method_selection_morphism )
    local base, current_morphism, current_value;
    
    base := Range( diagram[1] );
    
    for current_morphism in diagram{[ 2 .. Length( diagram ) ]} do
        
        current_value := IsEqualForObjects( Range( current_morphism ), base );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the fiber product diagram have equal ranges" ];
        elif current_value = false then
            return [ false, "the given morphisms of the fiber product diagram must have equal ranges" ];
        fi;
        
    od;
    
    return [ true ];
  end,
  return_type := "object" ),

ProjectionInFactorOfFiberProduct := rec(
  installation_name := "ProjectionInFactorOfFiberProductOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsInt, "morphism" ],
  io_type := [ [ "D", "k" ], [ "P", "D_k_source" ] ],
  cache_name := "ProjectionInFactorOfFiberProductOp",
  universal_object_position := "Source",
  universal_type := "Limit",
  dual_operation := "InjectionOfCofactorOfPushout",
  
  pre_function := function( diagram, projection_number, method_selection_morphism )
    local base, current_morphism, current_value;
    
    if projection_number < 1 or projection_number > Length( diagram ) then
        return[ false, Concatenation( "there does not exist a ", String( projection_number ), "th projection" ) ];
    fi;
    
    base := Range( diagram[1] );
    
    for current_morphism in diagram{[ 2 .. Length( diagram ) ]} do
        
        current_value := IsEqualForObjects( Range( current_morphism ), base );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the fiber product diagram have equal ranges" ];
        elif current_value = false then
            return [ false, "the given morphisms of the fiber product diagram must have equal ranges" ];
        fi;
        
    od;
    
    return [ true ];
  end,
  return_type := "morphism" ),

ProjectionInFactorOfFiberProductWithGivenFiberProduct := rec(
  installation_name := "ProjectionInFactorOfFiberProductWithGivenFiberProduct",
  filter_list := [ IsList, IsInt, "object" ],
  io_type := [ [ "D", "k", "P" ], [ "P", "D_k_source" ] ],
  cache_name := "ProjectionInFactorOfFiberProductWithGivenFiberProduct",
  universal_type := "Limit",
  dual_operation := "InjectionOfCofactorOfPushoutWithGivenPushout",
  
  pre_function := function( diagram, projection_number, pullback )
    local base, current_morphism, current_value;
    
    if projection_number < 1 or projection_number > Length( diagram ) then
        return[ false, Concatenation( "there does not exist a ", String( projection_number ), "th projection" ) ];
    fi;
    
    base := Range( diagram[1] );
    
    for current_morphism in diagram{[ 2 .. Length( diagram ) ]} do
        
        current_value := IsEqualForObjects( Range( current_morphism ), base );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the fiber product diagram have equal ranges" ];
        elif current_value = false then
            return [ false, "the given morphisms of the fiber product diagram must have equal ranges" ];
        fi;
        
    od;
    
    return [ true ];
  end,
  return_type := "morphism" ),

UniversalMorphismIntoFiberProduct := rec(
  installation_name := "UniversalMorphismIntoFiberProductOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsList, "morphism" ],
  io_type := [ [ "D", "tau" ], [ "tau_1_source", "P" ] ],
  cache_name := "UniversalMorphismIntoFiberProductOp",
  universal_object_position := "Range",
  universal_type := "Limit",
  dual_operation := "UniversalMorphismFromPushout",
  
  pre_function := function( diagram, source, method_selection_morphism )
    local base, current_morphism, current_value, current_morphism_position, test_object;
    
    if Length( diagram ) <> Length( source ) then
        return [ false, "fiber product diagram and test diagram must have equal length" ];
    fi;
    
    base := Range( diagram[1] );
    
    for current_morphism in diagram{[ 2 .. Length( diagram ) ]} do
        
        current_value := IsEqualForObjects( Range( current_morphism ), base );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the fiber product diagram have equal ranges" ];
        elif current_value = false then
            return [ false, "the given morphisms of the fiber product diagram must have equal ranges" ];
        fi;
        
    od;
    
    test_object := Source( source[1] );
    
    for current_morphism in source{[ 2 .. Length( source ) ]} do
        
        current_value := IsEqualForObjects( Source( current_morphism ), test_object );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the test source have equal sources" ];
        elif current_value = false then
            return [ false, "the given morphisms of the test source do not have equal sources" ];
        fi;
        
    od;
    
    for current_morphism_position in [ 1 .. Length( diagram ) ] do
        
        current_value := IsEqualForObjects( Source( diagram[ current_morphism_position ] ), Range( source[ current_morphism_position ] ) );
        
        if current_value = fail then
            return [ false, Concatenation( "in diagram position ", String( current_morphism_position ), ": cannot decide whether source and range are equal" ) ];
        elif current_value = false then
            return [ false, Concatenation( "in diagram position ", String( current_morphism_position ), ": source and range are not equal" ) ];
        fi;
        
    od;
    
    return [ true ];
  end,
  return_type := "morphism" ),

UniversalMorphismIntoFiberProductWithGivenFiberProduct := rec(
  installation_name := "UniversalMorphismIntoFiberProductWithGivenFiberProduct",
  filter_list := [ IsList, IsList, "object" ],
  io_type := [ [ "D", "tau", "P" ], [ "tau_1_source", "P" ] ],
  cache_name := "UniversalMorphismIntoFiberProductWithGivenFiberProduct",
  universal_type := "Limit",
  dual_operation := "UniversalMorphismFromPushoutWithGivenPushout",
  
  pre_function := function( diagram, source, pullback )
    local base, current_morphism, current_value, current_morphism_position, test_object;
    
    if Length( diagram ) <> Length( source ) then
        return [ false, "fiber product diagram and test diagram must have equal length" ];
    fi;
    
    base := Range( diagram[1] );
    
    for current_morphism in diagram{[ 2 .. Length( diagram ) ]} do
        
        current_value := IsEqualForObjects( Range( current_morphism ), base );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the fiber product diagram have equal ranges" ];
        elif current_value = false then
            return [ false, "the given morphisms of the fiber product diagram must have equal ranges" ];
        fi;
        
    od;
    
    test_object := Source( source[1] );
    
    for current_morphism in source{[ 2 .. Length( source ) ]} do
        
        current_value := IsEqualForObjects( Source( current_morphism ), test_object );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the test source have equal sources" ];
        elif current_value = false then
            return [ false, "the given morphisms of the test source do not have equal sources" ];
        fi;
        
    od;
    
    for current_morphism_position in [ 1 .. Length( diagram ) ] do
        
        current_value := IsEqualForObjects( Source( diagram[ current_morphism_position ] ), Range( source[ current_morphism_position ] ) );
        
        if current_value = fail then
            return [ false, Concatenation( "in diagram position ", String( current_morphism_position ), ": cannot decide whether source and range are equal" ) ];
        elif current_value = false then
            return [ false, Concatenation( "in diagram position ", String( current_morphism_position ), ": source and range are not equal" ) ];
        fi;
        
    od;
    
    return [ true ];
  end,
  return_type := "morphism" ),

Pushout := rec(
  installation_name := "PushoutOp",
  argument_list := [ 1 ],
  filter_list := [ IsList, "morphism" ],
  cache_name := "PushoutOp",
  universal_type := "Colimit",
  dual_operation := "FiberProduct",
  
  pre_function := function( diagram, method_selection_morphism )
    local cobase, current_morphism, current_value;
    
    cobase := Source( diagram[1] );
    
    for current_morphism in diagram{[ 2 .. Length( diagram ) ]} do
        
        current_value := IsEqualForObjects( Source( current_morphism ), cobase );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the pushout diagram have equal sources" ];
        elif current_value = false then
            return [ false, "the given morphisms of the pushout diagram must have equal sources" ];
        fi;
        
    od;
    
    return [ true ];
  end,
  return_type := "object" ),

InjectionOfCofactorOfPushout := rec(
  installation_name := "InjectionOfCofactorOfPushoutOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsInt, "morphism" ],
  io_type := [ [ "D", "k" ], [ "D_k_range", "I" ] ],
  cache_name := "InjectionOfCofactorOfPushoutOp",
  universal_object_position := "Range",
  universal_type := "Colimit",
  dual_operation := "ProjectionInFactorOfFiberProduct",
  
  pre_function := function( diagram, injection_number, method_selection_morphism )
    local cobase, current_morphism, current_value;
    
    if injection_number < 1 or injection_number > Length( diagram ) then
        return[ false, Concatenation( "there does not exist a ", String( injection_number ), "th injection" ) ];
    fi;
    
    cobase := Source( diagram[1] );
    
    for current_morphism in diagram{[ 2 .. Length( diagram ) ]} do
        
        current_value := IsEqualForObjects( Source( current_morphism ), cobase );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the pushout diagram have equal sources" ];
        elif current_value = false then
            return [ false, "the given morphisms of the pushout diagram must have equal sources" ];
        fi;
        
    od;
    
    return [ true ];
  end,
  return_type := "morphism" ),

InjectionOfCofactorOfPushoutWithGivenPushout := rec(
  installation_name := "InjectionOfCofactorOfPushoutWithGivenPushout",
  filter_list := [ IsList, IsInt, "object" ],
  io_type := [ [ "D", "k", "I" ], [ "D_k_range", "I" ] ],
  cache_name := "InjectionOfCofactorOfPushoutWithGivenPushout",
  universal_type := "Colimit",
  dual_operation := "ProjectionInFactorOfFiberProductWithGivenFiberProduct",
  
  pre_function := function( diagram, injection_number, pushout )
    local cobase, current_morphism, current_value;
    
    if injection_number < 1 or injection_number > Length( diagram ) then
        return[ false, Concatenation( "there does not exist a ", String( injection_number ), "th injection" ) ];
    fi;
    
    cobase := Source( diagram[1] );
    
    for current_morphism in diagram{[ 2 .. Length( diagram ) ]} do
        
        current_value := IsEqualForObjects( Source( current_morphism ), cobase );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the pushout diagram have equal sources" ];
        elif current_value = false then
            return [ false, "the given morphisms of the pushout diagram must have equal sources" ];
        fi;
        
    od;
    
    return [ true ];
  end,
  return_type := "morphism" ),

UniversalMorphismFromPushout := rec(
  installation_name := "UniversalMorphismFromPushoutOp",
  argument_list := [ 1, 2 ],
  filter_list := [ IsList, IsList, "morphism" ],
  io_type := [ [ "D", "tau" ], [ "I", "tau_1_range" ] ],
  cache_name := "UniversalMorphismFromPushoutOp",
  universal_object_position := "Source",
  universal_type := "Colimit",
  dual_operation := "UniversalMorphismIntoFiberProduct",
  
  pre_function := function( diagram, sink, method_selection_morphism )
    local cobase, current_morphism, current_value, current_morphism_position, test_object;
    
    if Length( diagram ) <> Length( sink ) then
        return [ false, "pushout diagram and test diagram must have equal length" ];
    fi;
    
    cobase := Source( diagram[1] );
    
    for current_morphism in diagram{[ 2 .. Length( diagram ) ]} do
        
        current_value := IsEqualForObjects( Source( current_morphism ), cobase );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the pushout diagram have equal sources" ];
        elif current_value = false then
            return [ false, "the given morphisms of the fiber pushout must have equal sources" ];
        fi;
        
    od;
    
    test_object := Range( sink[1] );
    
    for current_morphism in sink{[ 2 .. Length( sink ) ]} do
        
        current_value := IsEqualForObjects( Range( current_morphism ), test_object );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the test sink have equal ranges" ];
        elif current_value = false then
            return [ false, "the given morphisms of the test sink do not have equal ranges" ];
        fi;
        
    od;
    
    for current_morphism_position in [ 1 .. Length( diagram ) ] do
        
        current_value := IsEqualForObjects( Range( diagram[ current_morphism_position ] ), Source( sink[ current_morphism_position ] ) );
        
        if current_value = fail then
            return [ false, Concatenation( "in diagram position ", String( current_morphism_position ), ": cannot decide whether source and range are equal" ) ];
        elif current_value = false then
            return [ false, Concatenation( "in diagram position ", String( current_morphism_position ), ": source and range are not equal" ) ];
        fi;
        
    od;
    
    return [ true ];
  end,
  return_type := "morphism" ),

UniversalMorphismFromPushoutWithGivenPushout := rec(
  installation_name := "UniversalMorphismFromPushoutWithGivenPushout",
  filter_list := [ IsList, IsList, "object" ],
  io_type := [ [ "D", "tau", "I" ], [ "I", "tau_1_range" ] ],
  cache_name := "UniversalMorphismFromPushoutWithGivenPushout",
  universal_type := "Colimit",
  dual_operation := "UniversalMorphismIntoFiberProductWithGivenFiberProduct",
  
  pre_function := function( diagram, sink, pushout )
    local cobase, current_morphism, current_value, current_morphism_position, test_object;
    
    if Length( diagram ) <> Length( sink ) then
        return [ false, "pushout diagram and test diagram must have equal length" ];
    fi;
    
    cobase := Source( diagram[1] );
    
    for current_morphism in diagram{[ 2 .. Length( diagram ) ]} do
        
        current_value := IsEqualForObjects( Source( current_morphism ), cobase );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the pushout diagram have equal sources" ];
        elif current_value = false then
            return [ false, "the given morphisms of the fiber pushout must have equal sources" ];
        fi;
        
    od;
    
    test_object := Range( sink[1] );
    
    for current_morphism in sink{[ 2 .. Length( sink ) ]} do
        
        current_value := IsEqualForObjects( Range( current_morphism ), test_object );
        
        if current_value = fail then
            return [ false, "cannot decide whether the given morphisms of the test sink have equal ranges" ];
        elif current_value = false then
            return [ false, "the given morphisms of the test sink do not have equal ranges" ];
        fi;
        
    od;
    
    for current_morphism_position in [ 1 .. Length( diagram ) ] do
        
        current_value := IsEqualForObjects( Range( diagram[ current_morphism_position ] ), Source( sink[ current_morphism_position ] ) );
        
        if current_value = fail then
            return [ false, Concatenation( "in diagram position ", String( current_morphism_position ), ": cannot decide whether source and range are equal" ) ];
        elif current_value = false then
            return [ false, Concatenation( "in diagram position ", String( current_morphism_position ), ": source and range are not equal" ) ];
        fi;
        
    od;
    
    return [ true ];
  end,
  return_type := "morphism" ),

ImageObject := rec(
  installation_name := "ImageObject",
  filter_list := [ "morphism" ],
  universal_type := "Limit",
  return_type := "object",
  dual_operation := "Coimage" ),

ImageEmbedding := rec(
  installation_name := "ImageEmbedding",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "I", "alpha_range" ] ],
  universal_object_position := "Source",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "CoimageProjection" ),

ImageEmbeddingWithGivenImageObject := rec(
  installation_name := "ImageEmbeddingWithGivenImageObject",
  filter_list := [ "morphism", "object" ],
  io_type := [ [ "alpha", "I" ], [ "I", "alpha_range" ] ],
  cache_name := "ImageEmbeddingWithGivenImageObject",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "CoimageProjectionWithGivenCoimage" ),

Coimage := rec(
  installation_name := "Coimage",
  filter_list := [ "morphism" ],
  universal_type := "Colimit",
  return_type := "object",
  dual_operation := "ImageObject" ),

CoimageProjection := rec(
  installation_name := "CoimageProjection",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "alpha_source", "C" ] ],
  universal_object_position := "Range",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "ImageEmbedding" ),

CoimageProjectionWithGivenCoimage := rec(
  installation_name := "CoimageProjectionWithGivenCoimage",
  filter_list := [ "morphism", "object" ],
  io_type := [ [ "alpha", "C" ], [ "alpha_source", "C" ] ],
  cache_name := "CoimageProjectionWithGivenCoimage",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "ImageEmbeddingWithGivenImageObject" ),

AstrictionToCoimage := rec(
  installation_name := "AstrictionToCoimage",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "C", "alpha_range" ] ],
  universal_object_position := "Source",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "CoastrictionToImage" ),

AstrictionToCoimageWithGivenCoimage := rec(
  installation_name := "AstrictionToCoimageWithGivenCoimage",
  filter_list := [ "morphism", "object" ],
  io_type := [ [ "alpha", "C" ], [ "C", "alpha_range" ] ],
  cache_name := "AstrictionToCoimageWithGivenCoimage",
  universal_type := "Colimit",
  return_type := "morphism",
  dual_operation := "CoastrictionToImageWithGivenImageObject" ),

UniversalMorphismIntoCoimage := rec(
  installation_name := "UniversalMorphismIntoCoimage",
  filter_list := [ "morphism", IsList ],
  io_type := [ [ "alpha", "tau" ], [ "tau_1_range", "C" ] ],
  cache_name := "UniversalMorphismIntoCoimage",
  universal_object_position := "Range",
  universal_type := "Colimit",
  
  pre_function := function( morphism, test_factorization )
    local value;
    
    value := IsEqualForObjects( Source( morphism ), Source( test_factorization[ 1 ] ) );
    if value = fail then
        return [ false, "cannot decide whether source of morphism and test factorization are equal" ];
    elif value = false then
        return [ false, "source of morphism and test factorization are not equal" ];
    fi;
    
    value := IsEqualForObjects( Range( morphism ), Range( test_factorization[ 2 ] ) );
    if value = fail then
        return [ false, "cannot decide whether range of morphism and test factorization are equal" ];
    elif value = false then
        return [ false, "range of morphism and test factorization are not equal" ];
    fi;
    
    value := IsEqualForObjects( Range( test_factorization[ 1 ] ), Source( test_factorization[ 2 ] ) );
    if value = fail then
        return [ false, "cannot decide whether source and range of test factorization are equal" ];
    elif value = false then
        return [ false, "source and range of test factorization are not equal" ];
    fi;
    
    return [ true ];
  end,
  return_type := "morphism",
  dual_operation := "UniversalMorphismFromImage" ),

UniversalMorphismIntoCoimageWithGivenCoimage := rec(
  installation_name := "UniversalMorphismIntoCoimageWithGivenCoimage",
  filter_list := [ "morphism", IsList, "object" ],
  io_type := [ [ "alpha", "tau", "C" ], [ "tau_1_range", "C" ] ],
  cache_name := "UniversalMorphismIntoCoimageWithGivenCoimage",
  universal_type := "Colimit",
  
  pre_function := function( morphism, test_factorization, image )
    local value;
    
    value := IsEqualForObjects( Source( morphism ), Source( test_factorization[ 1 ] ) );
    if value = fail then
        return [ false, "cannot decide whether source of morphism and test factorization are equal" ];
    elif value = false then
        return [ false, "source of morphism and test factorization are not equal" ];
    fi;
    
    value := IsEqualForObjects( Range( morphism ), Range( test_factorization[ 2 ] ) );
    if value = fail then
        return [ false, "cannot decide whether range of morphism and test factorization are equal" ];
    elif value = false then
        return [ false, "range of morphism and test factorization are not equal" ];
    fi;
    
    value := IsEqualForObjects( Range( test_factorization[ 1 ] ), Source( test_factorization[ 2 ] ) );
    if value = fail then
        return [ false, "cannot decide whether source and range of test factorization are equal" ];
    elif value = false then
        return [ false, "source and range of test factorization are not equal" ];
    fi;
    
    return [ true ];
  end,
  return_type := "morphism",
  dual_operation := "UniversalMorphismFromImageWithGivenImageObject" ),

MorphismFromCoimageToImageWithGivenObjects := rec(
  installation_name := "MorphismFromCoimageToImageWithGivenObjects",
  filter_list := [ "object", "morphism", "object" ],
  io_type := [ [ "C", "alpha", "I" ], [ "C", "I" ] ],
  cache_name := "MorphismFromCoimageToImageWithGivenObjects",
  return_type := "morphism" ),

InverseMorphismFromCoimageToImageWithGivenObjects := rec(
  installation_name := "InverseMorphismFromCoimageToImageWithGivenObjects",
  filter_list := [ "object", "morphism", "object" ],
  io_type := [ [ "C", "alpha", "I" ], [ "I", "C" ] ],
  cache_name := "InverseMorphismFromCoimageToImageWithGivenObjects",
  return_type := "morphism" ),

IsWellDefinedForMorphisms := rec(
  installation_name := "IsWellDefined",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  
  redirect_function := function( morphism )
    
    if not ( IsWellDefined( Source( morphism ) ) and IsWellDefined( Range( morphism ) ) ) then
      
      return [ true, false ];
      
    else
      
      return [ false ];
      
    fi;
    
  end,
  
  return_type := "bool" ),

IsWellDefinedForObjects := rec(
  installation_name := "IsWellDefined",
  filter_list := [ "object" ],
  well_defined_todo := false,
  return_type := "bool" ),

IsZeroForObjects := rec(
  installation_name := "IsZero",
  filter_list := [ "object" ],
  well_defined_todo := false,
  return_type := "bool",
  property_of := "object" ),

IsMonomorphism := rec(
  installation_name := "IsMonomorphism",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  dual_operation := "IsEpimorphism",
  property_of := "morphism",
  is_reflected_by_faithful_functor := true ),

IsEpimorphism := rec(
  installation_name := "IsEpimorphism",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  dual_operation := "IsMonomorphism",
  property_of := "morphism",
  is_reflected_by_faithful_functor := true ),

IsIsomorphism := rec(
  installation_name := "IsIsomorphism",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  property_of := "morphism" ),

IsEndomorphism := rec(
  installation_name := "IsEndomorphism",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  property_of := "morphism" ),

IsAutomorphism := rec(
  installation_name := "IsAutomorphism",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  property_of := "morphism" ),

IsOne := rec(
  installation_name := "IsOne",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  property_of := "morphism",
  pre_function := function( morphism )
    local is_equal_for_objects;
    
    is_equal_for_objects := IsEqualForObjects( Source( morphism ), Range( morphism ) );
    
    if is_equal_for_objects = fail then
      
      return [ false, "cannot decide whether morphism is the identity" ];
      
    fi;
    
    if is_equal_for_objects = false then
        
        return [ false, "source and range of the given morphism are not equal" ];
        
    fi;
    
    return [ true ];
  end ),

IsSplitMonomorphism := rec(
  installation_name := "IsSplitMonomorphism",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  dual_operation := "IsSplitEpimorphism",
  property_of := "morphism" ),

IsSplitEpimorphism := rec(
  installation_name := "IsSplitEpimorphism",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  dual_operation := "IsSplitMonomorphism",
  property_of := "morphism" ),

IsIdempotent := rec(
   pre_function := function( morphism )
    
    #do not use IsEndomorphism( morphism ) here because you don't know if
    #the user has given an own IsEndomorphism function
    if not IsEqualForObjects( Source( morphism ), Range( morphism ) ) then 
      
      return [ false, "the given morphism has to be an endomorphism" ];
      
    fi;
    
    return [ true ];
  end,
  installation_name := "IsIdempotent",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  property_of := "morphism" ),

IsProjective := rec(
  installation_name := "IsProjective",
  filter_list := [ "object" ],
  well_defined_todo := false,
  return_type := "bool",
  dual_operation := "IsInjective",
  property_of := "object" ),

IsInjective := rec(
  installation_name := "IsInjective",
  filter_list := [ "object" ],
  well_defined_todo := false,
  return_type := "bool",
  dual_operation := "IsProjective",
  property_of := "object" ),

IsTerminal := rec(
  installation_name := "IsTerminal",
  filter_list := [ "object" ],
  well_defined_todo := false,
  return_type := "bool",
  dual_operation := "IsInitial",
  property_of := "object" ),

IsInitial := rec(
  installation_name := "IsInitial",
  filter_list := [ "object" ],
  well_defined_todo := false,
  return_type := "bool",
  dual_operation := "IsTerminal",
  property_of := "object" ),

IsIdenticalToIdentityMorphism := rec(
  installation_name := "IsIdenticalToIdentityMorphism",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  property_of := "morphism" ),

IsIdenticalToZeroMorphism := rec(
  installation_name := "IsIdenticalToZeroMorphism",
  filter_list := [ "morphism" ],
  well_defined_todo := false,
  return_type := "bool",
  property_of := "morphism" ),

CoastrictionToImage := rec(
  installation_name := "CoastrictionToImage",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "alpha_source", "I" ] ],
  universal_object_position := "Range",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "AstrictionToCoimage" ),

CoastrictionToImageWithGivenImageObject := rec(
  installation_name := "CoastrictionToImageWithGivenImageObject",
  filter_list := [ "morphism", "object" ],
  io_type := [ [ "alpha", "I" ], [ "alpha_source", "I" ] ],
  cache_name := "CoastrictionToImageWithGivenImageObject",
  universal_type := "Limit",
  return_type := "morphism",
  dual_operation := "AstrictionToCoimageWithGivenCoimage" ),

UniversalMorphismFromImage := rec(
  installation_name := "UniversalMorphismFromImage",
  filter_list := [ "morphism", IsList ],
  io_type := [ [ "alpha", "tau" ], [ "I", "tau_1_range" ] ],
  cache_name := "UniversalMorphismFromImage",
  universal_object_position := "Source",
  universal_type := "Limit",
  dual_operation := "UniversalMorphismIntoCoimage",
  
  pre_function := function( morphism, test_factorization )
    local value;
    
    value := IsEqualForObjects( Source( morphism ), Source( test_factorization[ 1 ] ) );
    if value = fail then
        return [ false, "cannot decide whether source of morphism and test factorization are equal" ];
    elif value = false then
        return [ false, "source of morphism and test factorization are not equal" ];
    fi;
    
    value := IsEqualForObjects( Range( morphism ), Range( test_factorization[ 2 ] ) );
    if value = fail then
        return [ false, "cannot decide whether range of morphism and test factorization are equal" ];
    elif value = false then
        return [ false, "range of morphism and test factorization are not equal" ];
    fi;
    
    value := IsEqualForObjects( Range( test_factorization[ 1 ] ), Source( test_factorization[ 2 ] ) );
    if value = fail then
        return [ false, "cannot decide whether source and range of test factorization are equal" ];
    elif value = false then
        return [ false, "source and range of test factorization are not equal" ];
    fi;
    
    return [ true ];
  end,
  return_type := "morphism" ),

UniversalMorphismFromImageWithGivenImageObject := rec(
  installation_name := "UniversalMorphismFromImageWithGivenImageObject",
  filter_list := [ "morphism", IsList, "object" ],
  io_type := [ [ "alpha", "tau", "I" ], [ "I", "tau_1_range" ] ],
  cache_name := "UniversalMorphismFromImageWithGivenImageObject",
  universal_type := "Limit",
  dual_operation := "UniversalMorphismIntoCoimageWithGivenCoimage",
  
  pre_function := function( morphism, test_factorization, image )
    local value;
    
    value := IsEqualForObjects( Source( morphism ), Source( test_factorization[ 1 ] ) );
    if value = fail then
        return [ false, "cannot decide whether source of morphism and test factorization are equal" ];
    elif value = false then
        return [ false, "source of morphism and test factorization are not equal" ];
    fi;
    
    value := IsEqualForObjects( Range( morphism ), Range( test_factorization[ 2 ] ) );
    if value = fail then
        return [ false, "cannot decide whether range of morphism and test factorization are equal" ];
    elif value = false then
        return [ false, "range of morphism and test factorization are not equal" ];
    fi;
    
    value := IsEqualForObjects( Range( test_factorization[ 1 ] ), Source( test_factorization[ 2 ] ) );
    if value = fail then
        return [ false, "cannot decide whether source and range of test factorization are equal" ];
    elif value = false then
        return [ false, "source and range of test factorization are not equal" ];
    fi;
    
    return [ true ];
  end,
  return_type := "morphism" ),

KernelObjectFunctorial := rec(
  installation_name := "KernelObjectFunctorial",
  filter_list := [ "morphism", "morphism", "morphism" ],
  io_type := [ [ "alpha", "mu", "alphap" ], [ "K", "Kp" ] ],
  cache_name := "KernelObjectFunctorial",
  return_type := "morphism",
  dual_operation := "CokernelFunctorial" ),

CokernelFunctorial := rec(
  installation_name := "CokernelFunctorial",
  filter_list := [ "morphism", "morphism", "morphism" ],
  io_type := [ [ "alpha", "nu", "alphap" ], [ "C", "Cp" ] ],
  cache_name := "CokernelFunctorial",
  return_type := "morphism",
  dual_operation := "KernelObjectFunctorial" ),

TerminalObjectFunctorial := rec(
  installation_name := "TerminalObjectFunctorial",
  filter_list := [ "category" ],
  ## TODO: io_type?
  cache_name := "TerminalObjectFunctorial",
  return_type := "morphism",
  dual_operation := "InitialObjectFunctorial" ),

InitialObjectFunctorial := rec(
  installation_name := "InitialObjectFunctorial",
  filter_list := [ "category" ],
  ## TODO: io_type?
  cache_name := "InitialObjectFunctorial",
  return_type := "morphism",
  dual_operation := "TerminalObjectFunctorial" ),

DirectProductFunctorial := rec(
  installation_name := "DirectProductFunctorialOp",
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "L" ], [ "P", "Pp" ] ],
  argument_list := [ 1 ],
  cache_name := "DirectProductFunctorialOp",
  return_type := "morphism",
  dual_operation := "CoproductFunctorial" ),

CoproductFunctorial := rec(
  installation_name := "CoproductFunctorialOp",
  argument_list := [ 1 ],
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "L" ], [ "I", "Ip" ] ],
  cache_name := "CoproductFunctorialOp",
  return_type := "morphism",
  dual_operation := "DirectProductFunctorial" ),

DirectSumFunctorial := rec(
  installation_name := "DirectSumFunctorialOp",
  argument_list := [ 1 ],
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "L" ], [ "S", "Sp" ] ],
  cache_name := "DirectSumFunctorialOp",
  return_type := "morphism" ),

FiberProductFunctorial := rec(
  installation_name := "FiberProductFunctorialOp",
  argument_list := [ 1 ],
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "L" ], [ "P", "Pp" ] ],
  cache_name := "FiberProductFunctorialOp",
  return_type := "morphism",
  dual_operation := "PushoutFunctorial" ),

PushoutFunctorial := rec(
  installation_name := "PushoutFunctorialOp",
  argument_list := [ 1 ],
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "L" ], [ "I", "Ip" ] ],
  cache_name := "PushoutFunctorialOp",
  return_type := "morphism",
  dual_operation := "FiberProductFunctorial" ),

HorizontalPreCompose := rec(
  installation_name := "HorizontalPreCompose",
  filter_list := [ "twocell", "twocell" ],
  cache_name := "HorizontalPreCompose",
  dual_operation := "HorizontalPostCompose",
  
  pre_function := function( twocell_1, twocell_2 )
    local value;
    
    value := IsEqualForObjects( Range( Source( twocell_1 ) ), Source( Source( twocell_2 ) ) );
    if value = fail then
        return [ false, "cannot decide whether 2-cells are horizontally composable" ];
    elif value = false then
        return [ false, "2-cells are not horizontally composable" ];
    fi;
    
    return [ true ];
  end,
  return_type := "twocell" ),

HorizontalPostCompose := rec(
  installation_name := "HorizontalPostCompose",
  filter_list := [ "twocell", "twocell" ],
  cache_name := "HorizontalPostCompose",
  dual_operation := "HorizontalPreCompose",
  
  pre_function := function( twocell_2, twocell_1 )
    local value;
    
    value := IsEqualForObjects( Range( Source( twocell_1 ) ), Source( Source( twocell_2 ) ) );
    if value = fail then
        return [ false, "cannot decide whether 2-cells are horizontally composable" ];
    elif value = false then
        return [ false, "2-cells are not horizontally composable" ];
    fi;
    
    return [ true ];
  end,
  return_type := "twocell" ),

VerticalPreCompose := rec(
  installation_name := "VerticalPreCompose",
  filter_list := [ "twocell", "twocell" ],
  cache_name := "VerticalPreCompose",
  dual_operation := "VerticalPostCompose",
  
  pre_function := function( twocell_1, twocell_2 )
    local value;
    
    value := IsEqualForMorphisms( Range( twocell_1 ), Source( twocell_2 ) );
    if value = fail then
        return [ false, "cannot decide whether 2-cells are vertically composable" ];
    elif value = false then
        return [ false, "2-cells are not vertically composable" ];
    fi;
    
    return [ true ];
  end,
  return_type := "twocell" ),

VerticalPostCompose := rec(
  installation_name := "VerticalPostCompose",
  filter_list := [ "twocell", "twocell" ],
  cache_name := "VerticalPostCompose",
  dual_operation := "VerticalPreCompose",
  
  pre_function := function( twocell_2, twocell_1 )
    local value;
    
    value := IsEqualForMorphisms( Range( twocell_1 ), Source( twocell_2 ) );
    if value = fail then
        return [ false, "cannot decide whether 2-cells are vertically composable" ];
    elif value = false then
        return [ false, "2-cells are not vertically composable" ];
    fi;
    
    return [ true ];
  end,
  return_type := "twocell" ),

IdentityTwoCell := rec(
  installation_name := "IdentityTwoCell",
  filter_list := [ "twocell" ],
  return_type := "twocell" ),

IsWellDefinedForTwoCells := rec(
  installation_name := "IsWellDefined",
  filter_list := [ "twocell" ],
  well_defined_todo := false,
  
  redirect_function := function( twocell )
    
    if not( IsWellDefined( Source( twocell ) ) and IsWellDefined( Range( twocell ) ) ) then
      
      return [ true, false ];
      
    fi;
    
    return [ false ];
    
  end,
  
  return_type := "bool" ),
  
DirectSumDiagonalDifference := rec(
  installation_name := "DirectSumDiagonalDifferenceOp",
  argument_list := [ 1 ],
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "D" ], [ "S", "D_1_range" ] ],
  cache_name := "DirectSumDiagonalDifferenceOp",
  return_type := "morphism",
  dual_operation := "DirectSumCodiagonalDifference" ),
  
FiberProductEmbeddingInDirectSum := rec(
  installation_name := "FiberProductEmbeddingInDirectSumOp",
  argument_list := [ 1 ],
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "D" ], [ "P", "S" ] ],
  cache_name := "FiberProductEmbeddingInDirectSumOp",
  return_type := "morphism",
  dual_operation := "DirectSumProjectionInPushout" ),
  
IsomorphismFromFiberProductToKernelOfDiagonalDifference := rec(
  installation_name := "IsomorphismFromFiberProductToKernelOfDiagonalDifferenceOp",
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "D" ], [ "P", "Delta" ] ],
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromFiberProductToKernelOfDiagonalDifferenceOp",
  return_type := "morphism",
  dual_operation := "IsomorphismFromCokernelOfDiagonalDifferenceToPushout" ),
  
IsomorphismFromKernelOfDiagonalDifferenceToFiberProduct := rec(
  installation_name := "IsomorphismFromKernelOfDiagonalDifferenceToFiberProductOp",
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "D" ], [ "Delta", "P" ] ],
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromKernelOfDiagonalDifferenceToFiberProductOp",
  return_type := "morphism",
  dual_operation := "IsomorphismFromPushoutToCokernelOfDiagonalDifference" ),

IsomorphismFromPushoutToCokernelOfDiagonalDifference := rec(
  installation_name := "IsomorphismFromPushoutToCokernelOfDiagonalDifferenceOp",
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "D" ], [ "I", "Delta" ] ],
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromPushoutToCokernelOfDiagonalDifferenceOp",
  return_type := "morphism",
  dual_operation := "IsomorphismFromKernelOfDiagonalDifferenceToFiberProduct" ),

IsomorphismFromCokernelOfDiagonalDifferenceToPushout := rec(
  installation_name := "IsomorphismFromCokernelOfDiagonalDifferenceToPushoutOp",
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "D" ], [ "Delta", "I" ] ],
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromCokernelOfDiagonalDifferenceToPushoutOp",
  return_type := "morphism",
  dual_operation := "IsomorphismFromFiberProductToKernelOfDiagonalDifference" ),

IsomorphismFromImageObjectToKernelOfCokernel := rec(
  installation_name := "IsomorphismFromImageObjectToKernelOfCokernel",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "I", "K" ] ],
  cache_name := "IsomorphismFromImageObjectToKernelOfCokernel",
  return_type := "morphism" ),

IsomorphismFromKernelOfCokernelToImageObject := rec(
  installation_name := "IsomorphismFromKernelOfCokernelToImageObject",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "K", "I" ] ],
  cache_name := "IsomorphismFromKernelOfCokernelToImageObject",
  return_type := "morphism" ),

IsomorphismFromCoimageToCokernelOfKernel := rec(
  installation_name := "IsomorphismFromCoimageToCokernelOfKernel",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "CI", "C" ] ],
  cache_name := "IsomorphismFromCoimageToCokernelOfKernel",
  return_type := "morphism" ),

IsomorphismFromCokernelOfKernelToCoimage := rec(
  installation_name := "IsomorphismFromCokernelOfKernelToCoimage",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "I", "CI" ] ],
  cache_name := "IsomorphismFromCokernelOfKernelToCoimage",
  return_type := "morphism" ),

IsomorphismFromDirectSumToDirectProduct := rec(
  installation_name := "IsomorphismFromDirectSumToDirectProductOp",
  filter_list := [ IsList, "object" ],
  io_type := [ [ "D" ], [ "S", "P" ] ],
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromDirectSumToDirectProductOp",
  return_type := "morphism",
  dual_operation := "IsomorphismFromCoproductToDirectSum" ),

IsomorphismFromDirectSumToCoproduct := rec(
  installation_name := "IsomorphismFromDirectSumToCoproductOp",
  filter_list := [ IsList, "object" ],
  io_type := [ [ "D" ], [ "S", "C" ] ],
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromDirectSumToCoproductOp",
  return_type := "morphism",
  dual_operation := "IsomorphismFromDirectProductToDirectSum" ),

IsomorphismFromDirectProductToDirectSum := rec(
  installation_name := "IsomorphismFromDirectProductToDirectSumOp",
  filter_list := [ IsList, "object" ],
  io_type := [ [ "D" ], [ "P", "S" ] ],
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromDirectProductToDirectSumOp",
  return_type := "morphism",
  dual_operation := "IsomorphismFromDirectSumToCoproduct" ),

IsomorphismFromCoproductToDirectSum := rec(
  installation_name := "IsomorphismFromCoproductToDirectSumOp",
  filter_list := [ IsList, "object" ],
  io_type := [ [ "D" ], [ "C", "S" ] ],
  argument_list := [ 1 ],
  cache_name := "IsomorphismFromCoproductToDirectSumOp",
  return_type := "morphism",
  dual_operation := "IsomorphismFromDirectSumToCoproduct" ),

DirectSumCodiagonalDifference := rec(
  installation_name := "DirectSumCodiagonalDifferenceOp",
  argument_list := [ 1 ],
  io_type := [ [ "D" ], [ "D_1_source", "S" ] ],
  filter_list := [ IsList, "morphism" ],
  cache_name := "DirectSumCodiagonalDifferenceOp",
  return_type := "morphism",
  dual_operation := "DirectSumDiagonalDifference" ),

DirectSumProjectionInPushout := rec(
  installation_name := "DirectSumProjectionInPushoutOp",
  filter_list := [ IsList, "morphism" ],
  io_type := [ [ "D" ], [ "S", "I" ] ],
  argument_list := [ 1 ],
  cache_name := "DirectSumProjectionInPushoutOp",
  return_type := "morphism",
  dual_operation := "FiberProductEmbeddingInDirectSum" ),

## Basic Operations for Monoidal Categories

TensorProductOnObjects := rec(
  installation_name := "TensorProductOnObjects",
  filter_list := [ "object", "object" ],
  cache_name := "TensorProductOnObjects",
  return_type := "object" ),

TensorProductOnMorphismsWithGivenTensorProducts := rec(
  installation_name := "TensorProductOnMorphismsWithGivenTensorProducts",
  filter_list := [ "object", "morphism", "morphism", "object" ],
  io_type := [ [ "s", "alpha", "beta", "r" ], [ "s", "r" ] ],
  cache_name := "TensorProductOnMorphismsWithGivenTensorProducts",
  return_type := "morphism" ),

AssociatorRightToLeftWithGivenTensorProducts := rec(
  installation_name := "AssociatorRightToLeftWithGivenTensorProducts",
  filter_list := [ "object", "object", "object", "object", "object" ],
  io_type := [ [ "s", "a", "b", "c", "r" ], [ "s", "r" ] ],
  cache_name := "AssociatorRightToLeftWithGivenTensorProducts",
  return_type := "morphism" ),

AssociatorLeftToRightWithGivenTensorProducts := rec(
  installation_name := "AssociatorLeftToRightWithGivenTensorProducts",
  filter_list := [ "object", "object", "object", "object", "object" ],
  io_type := [ [ "s", "a", "b", "c", "r" ], [ "s", "r" ] ],
  cache_name := "AssociatorLeftToRightWithGivenTensorProducts",
  return_type := "morphism" ),

TensorUnit := rec(
  installation_name := "TensorUnit",
  filter_list := [ "category" ],
  cache_name := "TensorUnit",
  return_type := "object" ),

LeftUnitorWithGivenTensorProduct := rec(
  installation_name := "LeftUnitorWithGivenTensorProduct",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "s" ], [ "s", "a" ] ],
  cache_name := "LeftUnitorWithGivenTensorProduct",
  return_type := "morphism" ),

LeftUnitorInverseWithGivenTensorProduct := rec(
  installation_name := "LeftUnitorInverseWithGivenTensorProduct",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  cache_name := "LeftUnitorInverseWithGivenTensorProduct",
  return_type := "morphism" ),

RightUnitorWithGivenTensorProduct := rec(
  installation_name := "RightUnitorWithGivenTensorProduct",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "s" ], [ "s", "a" ] ],
  cache_name := "RightUnitorWithGivenTensorProduct",
  return_type := "morphism" ),

RightUnitorInverseWithGivenTensorProduct := rec(
  installation_name := "RightUnitorInverseWithGivenTensorProduct",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  cache_name := "RightUnitorInverseWithGivenTensorProduct",
  return_type := "morphism" ),

BraidingWithGivenTensorProducts := rec(
  installation_name := "BraidingWithGivenTensorProducts",
  filter_list := [ "object", "object", "object", "object" ],
  io_type := [ [ "s", "a", "b", "r" ], [ "s", "r" ] ],
  cache_name := "BraidingWithGivenTensorProducts",
  return_type := "morphism" ),

BraidingInverseWithGivenTensorProducts := rec(
  installation_name := "BraidingInverseWithGivenTensorProducts",
  filter_list := [ "object", "object", "object", "object" ],
  io_type := [ [ "s", "a", "b", "r" ], [ "s", "r" ] ],
  cache_name := "BraidingInverseWithGivenTensorProducts",
  return_type := "morphism" ),

InternalHomOnObjects := rec(
  installation_name := "InternalHomOnObjects",
  filter_list := [ "object", "object" ],
  cache_name := "InternalHomOnObjects",
  return_type := "object" ),

InternalHomOnMorphismsWithGivenInternalHoms := rec(
  installation_name := "InternalHomOnMorphismsWithGivenInternalHoms",
  filter_list := [ "object", "morphism", "morphism", "object" ],
  io_type := [ [ "s", "alpha", "beta", "r" ], [ "s", "r" ] ],
  cache_name := "InternalHomOnMorphismsWithGivenInternalHoms",
  return_type := "morphism" ),

EvaluationMorphismWithGivenSource := rec(
  installation_name := "EvaluationMorphismWithGivenSource",
  filter_list := [ "object", "object", "object" ],
  io_type := [ [ "a", "b", "s" ], [ "s", "b" ] ],
  cache_name := "EvaluationMorphismWithGivenSource",
  return_type := "morphism" ),

CoevaluationMorphismWithGivenRange := rec(
  installation_name := "CoevaluationMorphismWithGivenRange",
  filter_list := [ "object", "object", "object" ],
  io_type := [ [ "a", "b", "r" ], [ "a", "r" ] ],
  cache_name := "CoevaluationMorphismWithGivenRange",
  return_type := "morphism" ),

TensorProductToInternalHomAdjunctionMap := rec(
  installation_name := "TensorProductToInternalHomAdjunctionMap",
  filter_list := [ "object", "object", "morphism" ],
  io_type := [ [ "a", "b", "f" ], [ "a", "i" ] ],
  cache_name := "TensorProductToInternalHomAdjunctionMap",
  return_type := "morphism" ),

InternalHomToTensorProductAdjunctionMap := rec(
  installation_name := "InternalHomToTensorProductAdjunctionMap",
  filter_list := [ "object", "object", "morphism" ],
  io_type := [ [ "b", "c", "g" ], [ "t", "c" ] ],
  cache_name := "InternalHomToTensorProductAdjunctionMap",
  return_type := "morphism" ),

MonoidalPreComposeMorphismWithGivenObjects := rec(
  installation_name := "MonoidalPreComposeMorphismWithGivenObjects",
  filter_list := [ "object", "object", "object", "object", "object" ],
  io_type := [ [ "s", "a", "b", "c", "r" ], [ "s", "r" ] ],
  cache_name := "MonoidalPreComposeMorphismWithGivenObjects",
  return_type := "morphism" ),

MonoidalPostComposeMorphismWithGivenObjects := rec(
  installation_name := "MonoidalPostComposeMorphismWithGivenObjects",
  filter_list := [ "object", "object", "object", "object", "object" ],
  io_type := [ [ "s", "a", "b", "c", "r" ], [ "s", "r" ] ],
  cache_name := "MonoidalPostComposeMorphismWithGivenObjects",
  return_type := "morphism" ),

DualOnObjects := rec(
  installation_name := "DualOnObjects",
  filter_list := [ "object" ],
  cache_name := "DualOnObjects",
  return_type := "object" ),

DualOnMorphismsWithGivenDuals := rec(
  installation_name := "DualOnMorphismsWithGivenDuals",
  io_type := [ [ "s", "alpha", "r" ], [ "s", "r" ] ],
  filter_list := [ "object", "morphism", "object" ],
  cache_name := "DualOnMorphismsWithGivenDuals",
  return_type := "morphism" ),

EvaluationForDualWithGivenTensorProduct := rec(
  installation_name := "EvaluationForDualWithGivenTensorProduct",
  filter_list := [ "object", "object", "object" ],
  io_type := [ [ "s", "a", "r" ], [ "s", "r" ] ],
  cache_name := "EvaluationForDualWithGivenTensorProduct",
  return_type := "morphism" ),

CoevaluationForDualWithGivenTensorProduct := rec(
  installation_name := "CoevaluationForDualWithGivenTensorProduct",
  filter_list := [ "object", "object", "object" ],
  io_type := [ [ "s", "a", "r" ], [ "s", "r" ] ],
  cache_name := "CoevaluationForDualWithGivenTensorProduct",
  return_type := "morphism" ),

MorphismToBidualWithGivenBidual := rec(
  installation_name := "MorphismToBidualWithGivenBidual",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  cache_name := "MorphismToBidualWithGivenBidual",
  return_type := "morphism" ),

MorphismFromBidualWithGivenBidual := rec(
  installation_name := "MorphismFromBidualWithGivenBidual",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "s" ], [ "s", "a" ] ],
  cache_name := "MorphismFromBidualWithGivenBidual",
  return_type := "morphism" ),

TensorProductInternalHomCompatibilityMorphismWithGivenObjects := rec(
  installation_name := "TensorProductInternalHomCompatibilityMorphismWithGivenObjects",
  filter_list := [ "object", "object", "object", "object", IsList ],
  io_type := [ [ "a", "ap", "b", "bp", "L" ], [ "L_1", "L_2" ] ],
  cache_name := "TensorProductInternalHomCompatibilityMorphismWithGivenObjects",
  return_type := "morphism" ),

TensorProductInternalHomCompatibilityMorphismInverseWithGivenObjects := rec(
  installation_name := "TensorProductInternalHomCompatibilityMorphismInverseWithGivenObjects",
  filter_list := [ "object", "object", "object", "object", IsList ],
  io_type := [ [ "a", "ap", "b", "bp", "L" ], [ "L_2", "L_1" ] ],
  cache_name := "TensorProductInternalHomCompatibilityMorphismInverseWithGivenObjects",
  return_type := "morphism" ),

TensorProductDualityCompatibilityMorphismWithGivenObjects := rec(
  installation_name := "TensorProductDualityCompatibilityMorphismWithGivenObjects",
  filter_list := [ "object", "object", "object", "object" ],
  io_type := [ [ "s", "a", "b", "r" ], [ "s", "r" ] ],
  cache_name := "TensorProductDualityCompatibilityMorphismWithGivenObjects",
  return_type := "morphism" ),

MorphismFromTensorProductToInternalHomWithGivenObjects := rec(
  installation_name := "MorphismFromTensorProductToInternalHomWithGivenObjects",
  filter_list := [ "object", "object", "object", "object" ],
  io_type := [ [ "s", "a", "b", "r" ], [ "s", "r" ] ],
  cache_name := "MorphismFromTensorProductToInternalHomWithGivenObjects",
  return_type := "morphism" ),

MorphismFromInternalHomToTensorProductWithGivenObjects := rec(
  installation_name := "MorphismFromInternalHomToTensorProductWithGivenObjects",
  filter_list := [ "object", "object", "object", "object" ],
  io_type := [ [ "s", "a", "b", "r" ], [ "s", "r" ] ],
  cache_name := "MorphismFromInternalHomToTensorProductWithGivenObjects",
  return_type := "morphism" ),

TraceMap := rec(
  installation_name := "TraceMap",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "u", "u" ] ],
  cache_name := "TraceMap",
  return_type := "morphism" ),

RankMorphism := rec(
  installation_name := "RankMorphism",
  filter_list := [ "object" ],
  io_type := [ [ "a" ], [ "u", "u" ] ],
  cache_name := "RankMorphism",
  return_type := "morphism" ),

IsomorphismFromTensorProductToInternalHom := rec(
  installation_name := "IsomorphismFromTensorProductToInternalHom",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "b" ], [ "t", "i" ] ],
  cache_name := "IsomorphismFromTensorProductToInternalHom",
  return_type := "morphism" ),

IsomorphismFromInternalHomToTensorProduct := rec(
  installation_name := "IsomorphismFromInternalHomToTensorProduct",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "b" ], [ "i", "t" ] ],
  cache_name := "IsomorphismFromInternalHomToTensorProduct",
  return_type := "morphism" ),
  
IsomorphismFromInternalHomToDual := rec(
  installation_name := "IsomorphismFromInternalHomToDual",
  filter_list := [ "object" ],
  io_type := [ [ "a" ], [ "i", "d" ] ],
  cache_name := "IsomorphismFromInternalHomToDual",
  return_type := "morphism" ),

IsomorphismFromDualToInternalHom := rec(
  installation_name := "IsomorphismFromDualToInternalHom",
  filter_list := [ "object" ],
  io_type := [ [ "a" ], [ "d", "i" ] ],
  cache_name := "IsomorphismFromDualToInternalHom",
  return_type := "morphism" ),

UniversalPropertyOfDual := rec(
  installation_name := "UniversalPropertyOfDual",
  filter_list := [ "object", "object", "morphism" ],
  io_type := [ [ "t", "a", "alpha" ], [ "t", "d" ] ],
  cache_name := "UniversalPropertyOfDual",
  return_type := "morphism" ),

LambdaIntroduction := rec(
  installation_name := "LambdaIntroduction",
  filter_list := [ "morphism" ],
  io_type := [ [ "alpha" ], [ "u", "i" ] ],
  cache_name := "LambdaIntroduction",
  return_type := "morphism" ),

LambdaElimination := rec(
  installation_name := "LambdaElimination",
  filter_list := [ "object", "object", "morphism" ],
  io_type := [ [ "a", "b", "alpha" ], [ "a", "b" ] ],
  cache_name := "LambdaElimination",
  return_type := "morphism" ),

IsomorphismFromObjectToInternalHomWithGivenInternalHom := rec(
  installation_name := "IsomorphismFromObjectToInternalHomWithGivenInternalHom",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  cache_name := "IsomorphismFromObjectToInternalHomWithGivenInternalHom",
  return_type := "morphism" ),

IsomorphismFromInternalHomToObjectWithGivenInternalHom := rec(
  installation_name := "IsomorphismFromInternalHomToObjectWithGivenInternalHom",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "s" ], [ "s", "a" ] ],
  cache_name := "IsomorphismFromInternalHomToObjectWithGivenInternalHom",
  return_type := "morphism" ),
  )
);

InstallGlobalFunction( CAP_INTERNAL_ENHANCE_NAME_RECORD,
  function( )
    local recnames, current_recname, current_rec, position, without_given_name;
    
    recnames := RecNames( CAP_INTERNAL_METHOD_NAME_RECORD );
    
    for current_recname in recnames do
      
      current_rec := CAP_INTERNAL_METHOD_NAME_RECORD.(current_recname);
      
      position := PositionSublist( current_recname, "WithGiven" );
      
      current_rec.is_with_given := false;
      
      if position <> fail then
         
         without_given_name := current_recname{[ 1 .. position - 1 ]};
         
         if without_given_name in recnames then
           
           current_rec.is_with_given := true;
           
         fi;
         
      fi;
      
    od;
    
end );

CAP_INTERNAL_ENHANCE_NAME_RECORD();