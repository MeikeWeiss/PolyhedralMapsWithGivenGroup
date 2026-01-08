LoadPackage("Digraphs", false);

#creates 8 point gadget for a chain c_d^2(g,h) by edge list
#gadget-vertices identifier: (g1*generator = g2 in G)
#[vertexNumber, g1, g2, generator, indexOfGadgetOnDChain]
8pointMaker := function(g1, g2, generator, index)
    local edges;

    edges := [ 
    [[1, g1, g2, generator, index], [2, g1, g2, generator, index]],
    [[1, g1, g2, generator, index], [3, g1, g2, generator, index]],
    [[1, g1, g2, generator, index], [4, g1, g2, generator, index]],
    [[2, g1, g2, generator, index], [3, g1, g2, generator, index]],
    [[2, g1, g2, generator, index], [5, g1, g2, generator, index]],
    [[4, g1, g2, generator, index], [6, g1, g2, generator, index]],
    [[3, g1, g2, generator, index], [7, g1, g2, generator, index]],
    [[5, g1, g2, generator, index], [8, g1, g2, generator, index]],
    [[6, g1, g2, generator, index], [7, g1, g2, generator, index]],
    [[7, g1, g2, generator, index], [8, g1, g2, generator, index]],
    ];
    
    return edges;
end;





##creates 10 point gadget for a chain c_d^2(g,h) by edge list
#gadget-vertices identifier: (g1*generator = g2 in G)
#[vertexNumber, g1, g2, generator]
10pointMaker := function(g1, g2, generator)
    local edges;
    ## internal edge List of 10 point gadget
    edges := [   
    [[0, g1, g2, generator], [1, g1, g2, generator]],
    [[0, g1, g2, generator], [2, g1, g2, generator]],
    [[0, g1, g2, generator], [3, g1, g2, generator]],
    [[1, g1, g2, generator], [3, g1, g2, generator]],
    [[1, g1, g2, generator], [6, g1, g2, generator]],
    [[2, g1, g2, generator], [4, g1, g2, generator]],
    [[2, g1, g2, generator], [5, g1, g2, generator]],
    [[3, g1, g2, generator], [5, g1, g2, generator]],
    [[4, g1, g2, generator], [7, g1, g2, generator]],
    [[5, g1, g2, generator], [8, g1, g2, generator]],
    [[6, g1, g2, generator], [9, g1, g2, generator]],
    [[7, g1, g2, generator], [8, g1, g2, generator]],
    [[8, g1, g2, generator], [9, g1, g2, generator]]
    ];

    return edges;
end;





##creates c_d^2(g,h) for elements g,h in G && gs = h
dChainMaker := function(g, h, s, colour)

    #runner is running variable
    #edgeList contains the edges returned by 8pointMaker and 10pointMaker
    #gadgetEdges contains the gadget-connecting edges
    local runner, edgeList, gadgetEdges;
    edgeList := [];
    gadgetEdges := [];

    ## add all 8point gadgets to edgeList
    for runner in [1 .. colour] do 
        Append(edgeList, 8pointMaker(g,h,s,runner));
    od;

    #add 10 point gadget to edgeList
    Append(edgeList, 10pointMaker(g,h,s));

    ##Add the gadget-connecting edges to gadgetEdges: only between 8 point-gadgets on the upper and lower level
    for runner in [1 .. colour - 1] do
        Add(gadgetEdges, [[5, g, h, s, runner], [4, g, h, s, runner+1]]);
        Add(gadgetEdges, [[8,g,h,s,runner], [6,g,h,s,runner+1]]);
    od;

    #Add the two gadget-connecting edges to gadgetEdges connecting the 8point gadget of index d to the sole 10point gadget
    Add(gadgetEdges, [[5,g,h,s, colour], [4,g,h,s]]);
    Add(gadgetEdges, [[8,g,h,s,colour], [7,g,h,s]]);

    #full d-chain edge list given by the concatenation of both edgelists
    return Concatenation(edgeList, gadgetEdges);
end;





#creates dummy node graph A_g^2 for an element g and the full generatorList. Case distinction between k>=3, k=2, k=1.
dummyGraphMaker := function(g, generatorList)

    #runner is running variable
    #outerEdges saves the block edges and the sd-block-connecting edges
    #innerEdges saves the edges in the interior center node cycles
    #connectingEdges saves the edges connecting two center of the same sd-block to one another
    local runner, outerEdges, innerEdges, connectingEdges;
    outerEdges := [];
    innerEdges := [];
    connectingEdges := [];

    #the case k >= 3
    if Length(generatorList) >= 3 then

        #iterate over generatorList for sd-block edges
        #first four edges are sd-block edges
        #last edge is sd-block-connecting edge using the self-described modd operator
        for runner in [1 .. Length(generatorList)] do
            Add(outerEdges, [["dummyNode", g, generatorList[runner], 1], ["dummyNode", g, generatorList[runner], 2]]);

            Add(outerEdges, [  ["dummyNode", g, generatorList[runner], 2] , ["centerNode", g, generatorList[runner], 1]  ]);

            Add(outerEdges,   [ ["centerNode", g, generatorList[runner], 1] , ["dummyNode", g, generatorList[runner], 3]   ]);

            Add(outerEdges,   [ ["dummyNode", g, generatorList[runner], 3] , ["dummyNode", g, generatorList[runner], 4] ]);

            Add(outerEdges,   [ ["dummyNode", g, generatorList[runner], 4] , ["dummyNode", g, generatorList[modd(runner+1, Length(generatorList))], 1] ]);
        od;

        #iterate over generatorList
        #add centerNode connecting edges
        for runner in [1 .. Length(generatorList)] do 
            Add(connectingEdges, [ ["centerNode", g, generatorList[runner], 1] , ["centerNode", g, generatorList[runner] , 2] ]);

        od;

        #iterate over generatorList
        #add the interior center node edges using the self-defined modd operator
        for runner in [1 .. Length(generatorList)] do

            Add(innerEdges, [ ["centerNode", g, generatorList[runner], 2] , ["centerNode", g, generatorList[modd(runner+1, Length(generatorList))], 2] ]);

        od;

    #the case k=2 : no center nodes of superscript 2, no interior center node cycle
    elif Length(generatorList) = 2 then 

        #iterate over generatorList (two elements)
        #first four are sd-block edges
        #last edge is sd-block-connecting edge
        for runner in [1 .. Length(generatorList)] do
            Add(outerEdges, [["dummyNode", g, generatorList[runner], 1], ["dummyNode", g, generatorList[runner], 2]]);

            Add(outerEdges, [  ["dummyNode", g, generatorList[runner], 2] , ["centerNode", g, generatorList[runner], 1]  ]);

            Add(outerEdges,   [ ["centerNode", g, generatorList[runner], 1] , ["dummyNode", g, generatorList[runner], 3]   ]);

            Add(outerEdges,   [ ["dummyNode", g, generatorList[runner], 3] , ["dummyNode", g, generatorList[runner], 4] ]);

            Add(outerEdges,   [ ["dummyNode", g, generatorList[runner], 4] , ["dummyNode", g, generatorList[modd(runner+1, Length(generatorList))], 1] ]);

        od;

        #only one edge connecting center nodes: the one connecting both center nodes of superscript one
        Add(outerEdges, [ ["centerNode", g, generatorList[1], 1] , ["centerNode", g, generatorList[2], 1] ]);

    #the case k=1 : only one sd-block that is self-connected --- no center nodes at all
    else 

        Add(outerEdges, [ ["dummyNode", g, generatorList[1],1] , ["dummyNode", g, generatorList[1], 2] ]);
        Add(outerEdges, [ ["dummyNode", g, generatorList[1],2] , ["dummyNode", g, generatorList[1], 3] ]);
        Add(outerEdges, [ ["dummyNode", g, generatorList[1],3] , ["dummyNode", g, generatorList[1], 4] ]);
        Add(outerEdges, [ ["dummyNode", g, generatorList[1],4] , ["dummyNode", g, generatorList[1], 1] ]);

    fi;

    #simply return the full concatenation. In some cases, some sets may be empty - does not matter since union-
    return Concatenation(outerEdges, innerEdges, connectingEdges);
end;





#connects the dummy node graphs to the d-chains for a fixed group element g in G and the given generatorList
dummyGraphChainConnecter := function(g, groupList, generatorList)

    local runner, generator, connectionlist, multi, checker;
    connectionlist := [];

    for generator in generatorList do
    #product of g times every generator --- operate from the right. multi = g*generator in thesis notation
        multi := generator * g;

        #checker looks for the element in the group corresponding to multi to have a canonical notation
        for checker in groupList do
            if ( multi = checker ) then 
                #connect A_g^2 to outgoing d-chain of generator
                Add(connectionlist, [["dummyNode", g, generator, 1] , [4, g, checker, generator, 1]]);
                Add(connectionlist, [ ["dummyNode", g, generator, 2] , [6, g, checker, generator, 1] ]);

                #connect A_h^2 to incoming d-chain of generator
                Add(connectionlist, [ ["dummyNode", checker, generator, 3] , [9, g, checker, generator]]);
                Add(connectionlist, [ ["dummyNode", checker, generator, 4] , [6, g, checker, generator]]);
                break;
            fi;
        od;
    od;

    return connectionlist;
end; 





#returns a full edgelist of the graph D in our notation
graphD2Lister := function(group, generatorList)

    #groupList contains the elements of the group in list notation
    #edgeList contains the full edgeList of D
    #runner is a running variable
    #generatorGroup is the group <generatorList>
    local edgeList, runner, groupList, generatorGroup, generator, multi, checker, g;
    groupList := Elements(group);
    edgeList := [];
    generatorGroup := GroupWithGenerators(generatorList);

    #sanity check: does <S> = G? If not: return 0. Invalid input
    if ( IsSubgroup(group, generatorGroup) = false or IndexNC(group, generatorGroup) <> 1) then
        return 0;
    fi;

    #iterate over all groupElements
    for g in groupList do 
        
        #add A_g^2 to edgeList for g
        Append(edgeList, dummyGraphMaker(g, generatorList));

        #add the d-chain gadget-connecting edges of A_g^2 to edgeList
        Append(edgeList, dummyGraphChainConnecter(g, groupList, generatorList));

        #iterate over all generators and add the d-chains to edgeList for g. Again, multi = g*generator in thesis notation and checker is used for canonical notation  
        for generator in generatorList do 
            multi := generator * g;

            for checker in groupList do
                if (multi = checker) then 
                    Append(edgeList, dChainMaker(g, checker, generator, Position(generatorList, generator)));
                    break;
                fi;
            od;
        od;


    od;

    return edgeList;
end;





#returns a list of all labels of all vertices in the graph D in the notation returned by graphD2Lister
#needed for translation from our own vertex labeling to standard Digraph vertex labeling
getLabels := function(list)

    #listLabels contains the labels, runner1 is a running variable
    local listLabels, runner1;
    listLabels := [];

    #check if the label in the edge of list at position runner1 is already contained in listLabels. If yes, continue, otherwise, add it to listLabels
    for runner1 in list do

        if ( fail = Position(listLabels, runner1[1]) ) then
            Add(listLabels, runner1[1]);
        fi;

        if ( fail = Position(listLabels, runner1[2]) ) then
            Add(listLabels, runner1[2]);
        fi;

    od;

    return listLabels;
end;





#translates the edgeList returned by graphD2Lister in personal vertex labeling in an integer edge list compatible with Digraphs Package
#the argument list handed to the function if the edge list of vertex labels returned by graphD2Lister
integerListMaker := function(list)

    #integerList is the new edgeList of graph D in integer notation
    #listLabels is the list of all vertex Labels in the graph D
    local integerList, listLabels, runner1, int1, int2;
    listLabels := getLabels(list);
    integerList := [];

    #iterate over all edges in D
    for runner1 in list do 

        #assign the vertex of label "xyz" in list the new integer label of its position in the the list "listLabels" that contains all labels of vertices in the graph D
        int1 := Position(listLabels, runner1[1]);
        int2 := Position(listLabels, runner1[2]);
        Add(integerList, [int1, int2]);

    od;

    return integerList;
end;





#test function
tester := function(group, generatorList)

    local positions, runner, graph, labels, wrongLabels;

    graph := graphD2MakerWithGenerators(group, generatorList);

    positions := [];
    wrongLabels := [];
    labels := [];

    for runner in Positions(InDegrees(graph), 2) do

        Add(positions, runner);

    od;

    Print(positions);

    labels := getLabels(graphD2Lister(group, generatorList));

    for runner in positions do

        Add(wrongLabels, labels[runner]);

    od;

    return wrongLabels;
end;





#creates our graph D as an object of the class Digraph given the input group and the generatorList
graphDMakerWithGenerators := function(group, generatorList)

    #labelEdgeList is the list returned by graphD2Lister
    #intEdgeList is the list returned by integerListMaker
    local labelEdgeList, intEdgeList;
    labelEdgeList := [];

    labelEdgeList := graphD2Lister(group, generatorList);

    intEdgeList := integerListMaker(labelEdgeList);

    #creates a Digraph from the integer edge List of intEdgeList. Symmetric Closure makes sure that all edges exist in both directions: Digraph only knows directed edges
    return DigraphSymmetricClosure(DigraphByEdges(intEdgeList));
end;





#creates our graph D as an object of the class Digraph given the input group. Computes a minimal generating set for group using the GAP method MinimalGeneratingSet
graphDMakerWithoutGenerators := function(group)

    #see above, same procedure
    local labelEdgeList, intEdgeList, generatorList;
    labelEdgeList := [];

    generatorList := MinimalGeneratingSet(group);

    labelEdgeList := graphD2Lister(group, generatorList);

    intEdgeList := integerListMaker(labelEdgeList);

    return DigraphSymmetricClosure(DigraphByEdges(intEdgeList));

end;





#modd operator for correct index handling
modd := function(index, limit)
    if (index in [1 .. limit]) then 
        return index;
    else 
        return (index mod limit) ;
    fi;
end;
