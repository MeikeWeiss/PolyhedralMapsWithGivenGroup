LoadPackage("Digraphs", false);
Read("./graphD.g");





#converts 1cutcdc in vertex labeling form into integer labeling form
#the vertex labels to integer conversion follows the exact same conversion as the conversion of the edgelist returned by graphD2Lister in graphD.g --- they are compatible
make1CutCDCAsTuplesWithGenerators := function(group, generatorList)
    local vertexLabels, cdc, cdcInteger, runner1, runner2, vertexChecker, combined, positions, counter, liste, path, flat, wrongV, flat1, generatorGroup, tupleCDC;
    combined :=[];
    vertexChecker := [];
    #initialize vertexLabels. We later need the indices of labels for comparing vertices & cycles
    vertexLabels := [];
    vertexLabels := getLabels(graphD2Lister(group, generatorList));
    positions := [];
    counter := 1;
    liste := [];
    path := [];
    cdcInteger := [];
    flat := [];
    wrongV := [];
    flat1 := [];
    tupleCDC := [];

    cdc := make1CutCDCWithGenerators(group, generatorList);


    #go over all cycles
    for runner1 in cdc do

        #go over the cycle in cdc at position runner1
        for runner2 in [1 .. Length(runner1)] do 

            #convert the cycle in cdc at position runner1 into one of integers with positions given by vertexLabels
            Add(path, Position(vertexLabels, runner1[runner2]));

        od;

        #cdcInteger saves the cycles as integers
        Add(cdcInteger, path);

        path := [];

    od;

    #convert the cycles from lists to tuples for compatibility with simplicial surfaces package
    for runner1 in cdcInteger do

        Add(tupleCDC, CycleFromList(runner1));
    od;

    #return the tuple
    return tupleCDC;

    #ignore everything below -- not reachable bc upper return statement
    flat := Flat(cdcInteger);
    flat1 := Collected(flat);

    #return flat1;

    for runner1 in flat1 do

        if runner1[2] <> 3 then

            Add(wrongV, vertexLabels[runner1[1]]);

        fi;

    od;

    return wrongV;

end;




#see above for explanation
make1CutCDCAsTuplesWithoutGenerators := function(group)
    local vertexLabels, cdc, cdcInteger, runner1, runner2, vertexChecker, combined, positions, counter, liste, path, flat, wrongV, flat1, generatorList, tupleCDC;
    combined :=[];
    vertexChecker := [];
    #initialize vertexLabels. We later need the indices of labels for comparing vertices & cycles
    vertexLabels := [];
    generatorList := MinimalGeneratingSet(group);
    vertexLabels := getLabels(graphD2Lister(group, generatorList));
    positions := [];
    counter := 1;
    liste := [];
    path := [];
    cdcInteger := [];
    flat := [];
    wrongV := [];
    flat1 := [];
    tupleCDC := [];


    cdc := make1CutCDCWithoutGenerators(group);

    #return cdc;

    for runner1 in cdc do

        for runner2 in [1 .. Length(runner1)] do

            Add(path, Position(vertexLabels, runner1[runner2]));

        od;

        Add(cdcInteger, path);

        path := [];

    od;

    for runner1 in cdcInteger do

        Add(tupleCDC, CycleFromList(runner1));

    od;

    return tupleCDC;

    #ignore everything below -- not reachable bc upper return statement
    flat := Flat(cdcInteger);
    flat1 := Collected(flat);

    #return flat1;

    for runner1 in flat1 do

        if runner1[2] <> 3 then

            Add(wrongV, vertexLabels[runner1[1]]);

        fi;

    od;

    return wrongV;

end;







#returns the interior face cycles for an 8point gadget of index "index" on the d chain c_d(g1,g2) where g1 s_d = g2
8pointCycler := function(g1, g2, generator, index)

    local cycleList;
    #the three inner face cycles of 8 point gadget
    cycleList := [

    [[1, g1, g2, generator, index], [2, g1, g2, generator, index], [3, g1, g2, generator, index]] ,

    [ [1, g1, g2, generator, index] , [4, g1, g2, generator, index] , [6, g1, g2, generator, index] , [7, g1, g2, generator, index] , [3, g1, g2, generator, index] ] , 

    [ [2, g1, g2, generator, index] , [3, g1, g2, generator, index] , [7, g1, g2, generator, index] , [8, g1, g2, generator, index] , [5, g1, g2, generator, index] ]

    ];

    return cycleList;
end;





#returns the interior face cycles for a 10point gadget on the d chain c_d(g1,g2) where g1 s_d = g2
10pointCycler := function(g1, g2, generator)
    local cycleList;

    cycleList := [

    [ [0, g1, g2, generator] , [1, g1, g2, generator] , [3, g1, g2, generator] ] , 

    [ [0, g1, g2, generator] , [2, g1, g2, generator] , [5, g1, g2, generator] , [3, g1, g2, generator]] , 

    [ [2, g1, g2, generator] , [4, g1, g2, generator] , [7, g1, g2, generator] , [8, g1, g2, generator] , [5, g1, g2, generator] ] , 

    [ [1, g1, g2, generator] , [3, g1, g2, generator] , [5, g1, g2, generator] , [8, g1, g2, generator] , [9, g1, g2, generator] , [6, g1, g2, generator] ]

    ]; 

    return cycleList;
end;





#returns the interior cycle of centernodes for specific g in G
centerCycler := function (g, generatorList)

    local cycleList, generator;
    cycleList := [];

    for generator in generatorList do 
        Add(cycleList, ["centerNode", g, generator, 2]);
    od;

    return cycleList;
end;





#returns the sdblock face cycle induced by g1 and g2
sdBlockCycler := function (g, generator1, generator2)
    local blockCycle;

    blockCycle := [ 

    ["centerNode", g, generator1, 1], 
    ["dummyNode", g, generator1, 3], 
    ["dummyNode", g, generator1, 4],
    ["dummyNode", g, generator2, 1],
    ["dummyNode", g, generator2, 2],
    ["centerNode", g, generator2, 1], 
    ["centerNode", g, generator2, 2], 
    ["centerNode", g, generator1, 2]

    ];

    return blockCycle;
end;





#returns the sd-block cycles for k=2 generators
sdBlockCycler2Gens := function(g, generator1, generator2)

    local blockCycle1, blockCycle2, blocks;
    blocks := [];

    blockCycle1 := [

        ["centerNode", g, generator1, 1],
        ["dummyNode", g, generator1, 3],
        ["dummyNode", g, generator1, 4],
        ["dummyNode", g, generator2,1],
        ["dummyNode", g, generator2, 2],
        ["centerNode", g, generator2, 1]

    ];

    blockCycle2 := [

        ["centerNode", g, generator2, 1],
        ["dummyNode", g, generator2, 3],
        ["dummyNode", g, generator2, 4],
        ["dummyNode", g, generator1,1],
        ["dummyNode", g, generator1, 2],
        ["centerNode", g, generator1, 1]

    ];

    Add(blocks, blockCycle1);
    Add(blocks, blockCycle2);

    return blocks;
end;





#returns the only face cycle in A_g^2 for k=1 generator
sdBlockCycler1Gen := function(g, generator) 

    local interiorCycle, blocks;
    blocks := [];

    interiorCycle := [
        
        ["dummyNode", g, generator, 1],
        ["dummyNode", g, generator, 2],
        ["dummyNode", g, generator, 3],
        ["dummyNode", g, generator, 4]

    ];

    Add(blocks, interiorCycle);
    return blocks;
end;


#returns the facecycles of sdBlocks for a specific g in G
blockCycler := function(g, generatorList)
    local blockCycles, runner;
    blockCycles := [];

    #case k >= 3
    if Length(generatorList) >= 3 then
        #iterate over all generators and create sd-block cycle iteratively
        for runner in [1 .. Length(generatorList)] do
            Add(blockCycles, sdBlockCycler(g, generatorList[runner], generatorList[modd(runner+1, Length(generatorList))]));
        od;
    #case k = 2
    elif Length(generatorList) = 2 then
        blockCycles := sdBlockCycler2Gens(g, generatorList[1], generatorList[2]);
    
    #case k = 1
    else
        blockCycles := sdBlockCycler1Gen(g, generatorList[1]);
        #Print(blockCycles);
    fi;

    return blockCycles;
end;





##final method: constructs the facecycles of sdBlocks for the total group iteratively for all g in G
groupBlocksCycler := function(group, generatorList)

    #blockCycles contains the cycles
    local blockcycles, runner;
    blockcycles := [];

    for runner in (Elements(group)) do
        Append(blockcycles, blockCycler(runner, generatorList));

        #in the case k>=3, we also have the cycle induced by the interior center nodes
        if (Length(generatorList) >= 3) then
            Add(blockcycles, centerCycler(runner, generatorList));
        fi;
    od;
    return blockcycles;
end;





#returns the set of all face cycles on the chain c_s(g,h). colour is the index of s in S. includes all gcc face cycles
dChainFacer := function(g,h,s,colour)

    #faceCycle contains the cycles in the list
    local runner, faceCycle;
    faceCycle := [];

    ##add face cycles between the two level of gc edges of the d-chain & dummy node graphs
    Add(faceCycle, [ ["dummyNode", g, s, 1] , [4, g, h, s, 1] , [6, g, h, s, 1] , ["dummyNode", g, s, 2] ]);
    Add(faceCycle, [ ["dummyNode", h, s, 3] , [9, g, h, s] , [6, g, h, s] , ["dummyNode", h, s, 4] ]);

    for runner in [1 .. colour] do 

        ##add cycles from gadget of index runner
        Append(faceCycle, 8pointCycler(g,h,s,runner));
        
        ##add face cycle in between ggc edges
        if runner < colour then
            Add(faceCycle, [ [5, g, h, s, runner] , [4, g, h, s, runner+1], [6, g, h, s, runner+1], [8, g, h, s, runner] ]);
        fi;
    
    od;

    Add(faceCycle, [ [5, g, h, s, colour] , [4, g, h, s] , [7,g,h,s] , [8, g, h, s, colour] ]);

    Append(faceCycle, 10pointCycler(g,h,s));

    return faceCycle; 
end;





#intermediate function: compute faces of d chains of all generators for specific g in G
intermediateDChainsFacer := function(group, generatorList, g)

    #multi is product of g*generator in thesis notation
    #dchainFaces contains the face cycles for all d-chains going out of g
    local multi, checker, runner, dChainFaces;
    dChainFaces := [];

    for runner in generatorList do 

        multi := runner * g;

            #checker looks for element multi corresponding in the group. used for canonical notation in labels
            for checker in Elements(group) do
                if (multi = checker) then

                    #add the d-chain faces of that specific d-chain
                    Append(dChainFaces, dChainFacer(g, checker, runner, Position(generatorList, runner)));
                fi;
            od;
    od;

    return dChainFaces;
end;


#final function: compute dChain Faces for all chains of all group elements
groupChainsFacer := function (group, generatorList)

    local runner, chainCycles;
    chainCycles := [];

    #iterate over all group elements
    for runner in group do

        Append(chainCycles, intermediateDChainsFacer(group, generatorList, runner));

    od;

    return chainCycles;
end;





#function returns upper d path from g to h for roof edge cycles as vertex sequence INCLUDING the dummy nodes and center Node
upperPath := function(g,h,s, colour)

    local runner, path; 

    path := [];

    Add(path, ["dummyNode", g, s, 1]);

    #colour is index of generator s
    #add colour many upper paths along the 8point gadgets
    for runner in [1 .. colour] do 
        ##upper path along all colour many 8point gadgets
        Add(path, [4, g, h, s, runner]);
        Add(path, [1, g, h, s, runner]);
        Add(path, [2, g, h, s, runner]);
        Add(path, [5, g, h, s, runner]);
    od;

    #add the upper path of that d-chain along the 10-point gadget
    Add(path, [4,g,h,s]);
    Add(path, [2,g,h,s]);
    Add(path, [0,g,h,s]);
    Add(path, [1,g,h,s]);
    Add(path, [6,g,h,s]);
    
    #add the arrival point in the dummy node graph A_h^2 of h
    Add(path, ["dummyNode", h, s, 4]);

    return path;
end;


#returns the lower path from g to h for base edge cycles as a vertex sequence INCLUDING the two dummy nodes starting and endpoint
#colour is the index of generator s
lowerPath := function(g,h,s,colour, generatorList)

    local runner, path;

    path := [];

    #starting point of lower d-path
    Add(path, ["dummyNode", g, s, 2]);

    #lower path along colour many 8-point gadgets
    for runner in [1 .. colour] do 

        Add(path, [6,g,h,s,runner]);
        Add(path, [7,g,h,s,runner]);
        Add(path, [8,g,h,s,runner]);
    od;

    #lower path along the sole 10point gadget
    Add(path, [7,g,h,s]);
    Add(path, [8,g,h,s]);
    Add(path, [9,g,h,s]);


    #arrival in A_h^2 in lower path. Go up to exterior center node
    #make case distinction between k=1 and k >= 2 as k=1 has no center nodes
    if Length(generatorList) > 1 then
        Add(path, ["dummyNode", h, s, 3]);
        Add(path, ["centerNode", h, s ,1]);
    
    else
        Add(path, ["dummyNode", h, s, 3]);

    fi;
    return path;
end;





#computes the base edge cycle starting in A_g^2 for generator index colour. returned in variable combinedReturn
lowerCycle := function(group, generator, g, colour, generatorList)

    #combinedReturn contains both the left coset g<s> and the base edge cycle induced by it
    #stationList contains the elements in g<s> over computation time
    local runner, multi1, multi2, checker, stationList, path, combinedReturn, elements;
    stationList := [];
    path := [];
    combinedReturn := [];
    multi1 := g;
    elements := ShallowCopy(Elements(group));

    #see thesis: need order of generator 
    #ocmpute the power gs^i for i in [1, ..., order(s)]
    #and compute the corresponding lower d-paths
    for runner in [1 .. Order(generator)] do

        #thesis notation: multi2 = multi 1 * generator
        multi2 := generator * multi1;

        #checker looks for multi2 in GAP notation. used for canonical vertex labeling
        for checker in elements do

            if (multi2 = checker) then

                #return the lower path from multi1 to mutli2 = checker with generator of index colour
                Append(path, lowerPath(multi1, checker, generator, colour, generatorList));
            fi;
        od;

        Add(stationList, multi2);
        multi1 := multi2;
    od;

    Add(combinedReturn, path);
    Add(combinedReturn, stationList);

    #combinedReturn[1] = lower base edge cycle
    #combinedReturn[2] = g<s>
    return combinedReturn;
end;





#generates all lower cycles for a fixed generator
lowerCyclesInGenerator := function(group, generator, colour, generatorList)

    #proceed as in the thesis algorithm
    #start with total G. Then reduce G by the elements in left coset g<s> until G empty.
    #lowerCycles is the set of base edge cycles of generator 
    local runner, lowerCycles, stationList, elements, returner, position;
    elements := ShallowCopy(Elements(group));
    returner := []; 
    lowerCycles := [];

    #termination condition: elements = \tilde(G) in thesis notation
    while elements <> [] do 

        #compute the lower cycle and the left coset
        returner := lowerCycle(group, generator, elements[1], colour, generatorList);

        Add(lowerCycles, returner[1]);

        #returner[2] contains the elements in g<s>
        #remove them from elements = \tilde(G)
        for runner in returner[2] do

            position := Position(elements, runner);
            Remove(elements, position);

        od;
    od;

    return lowerCycles;
end;


#final method. computes all lower cycles for all generators.
lowerCycler := function(group, generatorList)

    local generator, lowerCycles;
    lowerCycles := [];

    for generator in generatorList do

        Append(lowerCycles, lowerCyclesInGenerator(group, generator, Position(generatorList, generator), generatorList));

    od;

    return lowerCycles;
end;



#computes one specific roof edge cycle starting in A_g^2
#returns both the cycle and the set of elements in G whose dummy node graph we entered via s_k
upperCycle := function(group, generatorList, g)

    local runner1, runner2, runner3, path, prod, multi1, multi2, order, stationList, combinedReturn;
    path := [];
    stationList := [];
    prod := ();
    combinedReturn := [];

    #prod contains s := s1*s2 * ... * sk
    for runner1 in generatorList do
        prod := runner1 * prod;
    od;

    #proceed as in thesis algorithm: take lower path g along s_1 to h_1, then lower path h_1 along s_2 to h_2 and so on. Save all elements h in G entered via s_k in stationList.
    multi1 := g;
    Add(stationList, multi1);

    #need order of the prod element
    #repeat the process order(prod) many times
    for runner1 in [1 .. Order(prod)] do 

        for runner2 in generatorList do 

            multi2 := runner2 * multi1;

            for runner3 in Elements(group) do
                
                #canonical notation for vertex labels
                if (multi2 = runner3) then
                    #take the upper path from multi1 along chain of generator runner2 to element multi2
                    Append(path, upperPath(multi1, runner3, runner2, Position(generatorList, runner2)));
                fi;
            od;
            #update multi1
            multi1 := multi2;

            #check is runner2 is last generator in generatorList and add it to elements we entered via generator s_k
            if  (Position(generatorList, runner2) = Length(generatorList)) then

                Add(stationList, multi2);

            fi;
        od;
    od;

    #remove the last element from stationList (it is the same as the very first element)
    Remove(stationList, Length(stationList));

    #Add to combinedReturn both the roof edge cycle and the stationList that we need to reduce \tilde(G) by
    Add(combinedReturn, path);
    Add(combinedReturn, stationList);

    return combinedReturn;
end;





#final method for upper cycles
#returns all roof edge cycles
upperCycler := function(group, generatorList)

    local element, cycle, cycleList, stationList, returner, G, runner, position;
    cycleList := [];
    G := ShallowCopy(Elements(group));

    #G is the set \tilde(G) in thesis notation
    while (G <> []) do 

        #cycle contains the roof edge cycle
        #stationList the list of elements we have to reduce G by
        returner := upperCycle(group, generatorList, G[1]);
        cycle := returner[1];
        stationList := returner[2];
        Add(cycleList, cycle);

        #remove elements in StationList from G
        for runner in stationList do 

            position := Position(G, runner);
            Remove(G, position);
        od;

        stationList := [];
    od;

    return cycleList;
end;




#generates the cdc using our own vertex labeling
make1CutCDCWithGenerators := function(group, generatorList)

    local cdc, generatorGroup;
    cdc := [];
    generatorGroup := GroupWithGenerators(generatorList);

    #sanity check: <S> = G?
    if ( IsSubgroup(group, generatorGroup) = false or IndexNC(group, generatorGroup) <> 1) then
        return 0;
    fi;

    #just call all methods
    Append(cdc, groupBlocksCycler(group, generatorList));
    Append(cdc, upperCycler(group, generatorList));
    Append(cdc, lowerCycler(group, generatorList));
    Append(cdc, groupChainsFacer(group, generatorList));

    return(cdc);

end;





#generates the 1cutcdc using our own vertex labeling and a minimal generating set for group computed by GAP function MinimalGeneratingSet
#see above for explanation
make1CutCDCWithoutGenerators := function(group)

    local cdc, generatorList;
    cdc := [];
    generatorList := MinimalGeneratingSet(group);

    Append(cdc, upperCycler(group, generatorList));
    Append(cdc, lowerCycler(group, generatorList));
    Append(cdc, groupChainsFacer(group, generatorList));
    Append(cdc, groupBlocksCycler(group, generatorList));

    return(cdc);

end;


