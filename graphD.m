intrinsic Positions(l::SeqEnum, x::.) -> SeqEnum
    {TODO}
    temp:= [1 .. #l];
    return [i : i in temp | l[i] eq x];
end intrinsic;

//creates 8 point gadget for a chain c_d^2(g,h) by edge list
//gadget-vertices identifier: (g1*generator = g2 in G)
//[vertexNumber, g1, g2, generator, indexOfGadgetOnDChain]
intrinsic pointMaker8(g1::GrpPermElt, g2::GrpPermElt, generator::GrpPermElt, index::RngIntElt) -> SeqEnum
    {TODO}
    edges := [ 
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]", "[ 2, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]", "[ 3, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]", "[ 4, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]", "[ 3, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]", "[ 5, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]", "[ 6, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]", "[ 7, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]", "[ 8, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]", "[ 7, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]", "[ 8, " cat Sprint(g1) cat ", " cat Sprint(g2) cat ", " cat Sprint(generator) cat ", " cat Sprint(index) cat " ]" @},
    ];
    
    return edges;
end intrinsic;





////creates 10 point gadget for a chain c_d^2(g,h) by edge list
//gadget-vertices identifier: (g1*generator = g2 in G)
//[vertexNumber, g1, g2, generator]
intrinsic pointMaker10(g1::GrpPermElt, g2::GrpPermElt, generator::GrpPermElt) -> SeqEnum
    {TODO}
    //// internal edge List of 10 point gadget
    edges := [   
    {@ "[ 0, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 0, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 2, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 0, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 3, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 3, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 1, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 6, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 2, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 4, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 2, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 5, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 3, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 5, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 4, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 7, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 5, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 8, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 6, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 9, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 7, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 8, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @},
    {@ "[ 8, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]", "[ 9, " cat Sprint(g1) cat ", " cat Sprint(g2)  cat ", " cat Sprint(generator) cat " ]" @}
    ];

    return edges;
end intrinsic;





////creates c_d^2(g,h) for elements g,h in G && gs = h
intrinsic dChainMaker(g::GrpPermElt, h::GrpPermElt, s::GrpPermElt, colour::RngIntElt) ->SeqEnum
    {TODO}
    //runner is running variable
    //edgeList contains the edges returned by 8pointMaker and 10pointMaker
    //gadgetEdges contains the gadget-connecting edges
    edgeList := [];
    gadgetEdges := [];
    //// add all 8point gadgets to edgeList
    for runner in [1 .. colour] do 
        edgeList:= edgeList cat pointMaker8(g,h,s,runner);
    end for;

    //add 10 point gadget to edgeList
    edgeList:= edgeList cat pointMaker10(g,h,s);
    ////Add the gadget-connecting edges to gadgetEdges: only between 8 point-gadgets on the upper and lower level
    for runner in [1 .. colour - 1] do
        Append(~gadgetEdges, {@ "[ 5, " cat Sprint(g) cat ", " cat Sprint(h) cat ", " cat Sprint(s) cat ", " cat Sprint(runner) cat " ]", "[ 4, " cat Sprint(g) cat ", " cat Sprint(h) cat ", " cat Sprint(s) cat ", " cat Sprint(runner+1) cat " ]" @});
        Append(~gadgetEdges, {@ "[ 8, " cat Sprint(g) cat ", " cat Sprint(h) cat ", " cat Sprint(s) cat ", " cat Sprint(runner) cat " ]", "[ 6, " cat Sprint(g) cat ", " cat Sprint(h) cat ", " cat Sprint(s) cat ", " cat Sprint(runner+1) cat " ]" @});
    end for;

    //Add the two gadget-connecting edges to gadgetEdges connecting the 8point gadget of index d to the sole 10point gadget
    Append(~gadgetEdges, {@ "[ 5, " cat Sprint(g) cat ", " cat Sprint(h) cat ", " cat Sprint(s) cat ", " cat Sprint(colour) cat " ]", "[ 4, " cat Sprint(g) cat ", " cat Sprint(h) cat ", " cat Sprint(s) cat " ]" @});
    Append(~gadgetEdges, {@ "[ 8, " cat Sprint(g) cat ", " cat Sprint(h) cat ", " cat Sprint(s) cat ", " cat Sprint(colour) cat " ]", "[ 7, " cat Sprint(g) cat ", " cat Sprint(h) cat ", " cat Sprint(s) cat " ]" @});

    //full d-chain edge list given by the concatenation of both edgelists
    return edgeList cat gadgetEdges;
end intrinsic;





//creates dummy node graph A_g^2 for an element g and the full generatorList. Case distinction between k>=3, k=2, k=1.
intrinsic dummyGraphMaker(g::GrpPermElt, generatorList::SeqEnum) -> SeqEnum
    {TODO}
    //runner is running variable
    //outerEdges saves the block edges and the sd-block-connecting edges
    //innerEdges saves the edges in the interior center node cycles
    //connectingEdges saves the edges connecting two center of the same sd-block to one another
    outerEdges := [ ];
    innerEdges := [ ];
    connectingEdges := [ ];

    //the case k >= 3
    if #generatorList ge 3 then

        //iterate over generatorList for sd-block edges
        //first four edges are sd-block edges
        //last edge is sd-block-connecting edge using the self-described modd operator
        for runner in [1 .. #generatorList] do
            Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 1 ]", "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 2 ]" @});

            Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 2 ]" , "[ centerNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 1 ]" @});

            Append(~outerEdges, {@ "[ centerNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 1 ]" , "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 3 ]" @});

            Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 3 ]" , "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 4 ]" @});

            Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 4 ]" , "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[modd(runner+1, #generatorList)]) cat ", 1 ]" @});
        end for;

        //iterate over generatorList
        //add centerNode connecting edges
        for runner in [1 .. #generatorList] do 
            Append(~connectingEdges, {@ "[ centerNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 1 ]" , "[ centerNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 2 ]" @});
        end for;

        //iterate over generatorList
        //add the interior center node edges using the self-defined modd operator
        for runner in [1 .. #generatorList] do

            Append(~innerEdges, {@ "[ centerNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 2 ]" , "[ centerNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[modd(runner+1, #generatorList)]) cat ", 2 ]" @});

        end for;

    //the case k=2 : no center nodes of superscript 2, no interior center node cycle
    elif #generatorList eq 2 then 

        //iterate over generatorList (two elements)
        //first four are sd-block edges
        //last edge is sd-block-connecting edge
        for runner in [1 .. #generatorList] do
            Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 1 ]", "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 2 ]" @});

            Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 2 ]" , "[ centerNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 1 ]" @});

            Append(~outerEdges, {@ "[ centerNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 1 ]" , "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 3 ]" @});

            Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 3 ]" , "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 4 ]" @});

            Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[runner]) cat ", 4 ]" , "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[modd(runner+1, #generatorList)]) cat ", 1 ]" @});

        end for;

        //only one edge connecting center nodes: the one connecting both center nodes of superscript one
        Append(~outerEdges, {@ "[ centerNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[1]) cat ", " cat ", 1 ]" , "[ centerNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[2]) cat ", 1 ]" @});

    //the case k=1 : only one sd-block that is self-connected --- no center nodes at all
    else 

        Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[1]) cat ", 1 ]" , "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[1]) cat ", 2 ]" @});
        Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[1]) cat ", 2 ]" , "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[1]) cat ", 3 ]" @});
        Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[1]) cat ", 3 ]" , "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[1]) cat ", 4 ]" @});
        Append(~outerEdges, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[1]) cat ", 4 ]" , "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generatorList[1]) cat ", 1 ]" @});

    end if;

    //simply return the full concatenation. In some cases, some sets may be empty - does not matter since union-
    return outerEdges cat innerEdges cat connectingEdges;
end intrinsic;





//connects the dummy node graphs to the d-chains for a fixed group element g in G and the given generatorList
intrinsic dummyGraphChainConnecter(g::GrpPermElt, groupList::SeqEnum, generatorList::SeqEnum) ->SeqEnum
    {TODO}
    connectionlist := [];

    for generator in generatorList do
    //product of g times every generator --- operate from the right. multi = g*generator in thesis notation
        multi := generator * g;

        //checker looks for the element in the group corresponding to multi to have a canonical notation
        for checker in groupList do
            if ( multi eq checker ) then 
                //connect A_g^2 to outgoing d-chain of generator
                Append(~connectionlist, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generator) cat ", 1 ]" , "[ 4, " cat Sprint(g) cat ", " cat Sprint(checker) cat ", " cat Sprint(generator) cat ", 1 ]" @});
                Append(~connectionlist, {@ "[ dummyNode, " cat Sprint(g) cat ", " cat Sprint(generator) cat ", 2 ]" , "[ 6, " cat Sprint(g) cat ", " cat Sprint(checker) cat ", " cat Sprint(generator) cat ", 1 ]" @});

                //connect A_h^2 to incoming d-chain of generator
                Append(~connectionlist, {@ "[ dummyNode, " cat Sprint(checker) cat ", " cat Sprint(generator) cat ", 3 ]" , "[ 9, " cat Sprint(g) cat ", " cat Sprint(checker) cat ", " cat Sprint(generator) cat " ]" @});
                Append(~connectionlist, {@ "[ dummyNode, " cat Sprint(checker) cat ", " cat Sprint(generator) cat ", 4 ]" , "[ 6, " cat Sprint(g) cat ", " cat Sprint(checker) cat ", " cat Sprint(generator) cat " ]" @});
                break;
            end if;
        end for;
    end for;
    return connectionlist;
end intrinsic;





//returns a full edgelist of the graph D in our notation
intrinsic graphD2Lister(group::GrpPerm, generatorList::SeqEnum) -> SeqEnum
    {TODO}
    //groupList contains the elements of the group in list notation
    //edgeList contains the full edgeList of D
    //runner is a running variable
    //generatorGroup is the group <generatorList>
    groupList := [g: g in group];
    edgeList := [];
    //generatorGroup := GroupWithGenerators(generatorList);

    //sanity check: does <S> = G? If not: return 0. Invalid input
    //if ( IsSubgroup(group, generatorGroup) eq false or IndexNC(group, generatorGroup) ne 1) then
    //    return 0;
    //end if;

    //iterate over all groupElements
    for g in groupList do 
        
        //add A_g^2 to edgeList for g
        edgeList:=edgeList cat dummyGraphMaker(g, generatorList);
        //add the d-chain gadget-connecting edges of A_g^2 to edgeList
        edgeList:=edgeList cat dummyGraphChainConnecter(g, groupList, generatorList);
        //iterate over all generators and add the d-chains to edgeList for g. Again, multi = g*generator in thesis notation and checker is used for canonical notation  
        for generator in generatorList do 
            multi := generator * g;

            for checker in groupList do 
                if (multi eq checker) then 
                    edgeList:=edgeList cat dChainMaker(g, checker, generator, Position(generatorList, generator));
                end if;
            end for;
        end for;
    end for;
    return edgeList;
end intrinsic;





//returns a list of all labels of all vertices in the graph D in the notation returned by graphD2Lister
//needed for translation from our own vertex labeling to standard Digraph vertex labeling
intrinsic getLabels(list::SeqEnum) ->SeqEnum
    {TODO}
    //listLabels contains the labels, runner1 is a running variable
    listLabels := [];

    //check if the label in the edge of list at position runner1 is already contained in listLabels. If yes, continue, otherwise, add it to listLabels
    for runner1 in list do

        if ( 0 eq Position(listLabels, runner1[1]) ) then
            Append(~listLabels, runner1[1]);
        end if;

        if ( 0 eq Position(listLabels, runner1[2]) ) then
            Append(~listLabels, runner1[2]);
        end if;
    end for;

    return listLabels;
end intrinsic;





//translates the edgeList returned by graphD2Lister in personal vertex labeling in an integer edge list compatible with Digraphs Package
//the argument list handed to the function if the edge list of vertex labels returned by graphD2Lister
intrinsic integerListMaker(list::SeqEnum) -> SeqEnum
    {TODO}
    //integerList is the new edgeList of graph D in integer notation
    //listLabels is the list of all vertex Labels in the graph D
    listLabels := getLabels(list);
    integerList := [];
    //iterate over all edges in D
    for runner1 in list do 

        //assign the vertex of label "xyz" in list the new integer label of its position in the the list "listLabels" that contains all labels of vertices in the graph D
        int1 := Position(listLabels, runner1[1]);
        int2 := Position(listLabels, runner1[2]);
        Append(~integerList, [int1, int2]);

    end for;

    return integerList;
end intrinsic;











//creates our graph D as an object of the class Digraph given the input group and the generatorList
intrinsic graphDMakerWithGenerators(group::GrpPerm, generatorList::SeqEnum) -> GrphUnd
    {TODO}
    //labelEdgeList is the list returned by graphD2Lister
    //intEdgeList is the list returned by integerListMaker
    labelEdgeList := [];

    labelEdgeList := graphD2Lister(group, generatorList);
    vertices:=&join labelEdgeList;
    verticesL:= Setseq(vertices);
    graph:=EmptyGraph(#vertices);
    V:=Vertices(graph);
    for i in [1 .. #verticesL] do
        AssignLabel(~graph,V!i, verticesL[i]);
    end for;
    phi:=map<vertices-> {1 .. #vertices}| x:-> Position(verticesL,x)>;
    for e in labelEdgeList do
        AddEdge(~graph,phi(e[1]),phi(e[2]));
    end for;
    return graph;
end intrinsic;





//creates our graph D as an object of the class Digraph given the input group. Computes a minimal generating set for group using the GAP method MinimalGeneratingSet
intrinsic graphDMakerWithoutGenerators(group::GrpPerm) -> GrphUnd
    {TODO}
    //see above, same procedure
    labelEdgeList := [];

    generatorList := Setseq(Generators(group));
    labelEdgeList := graphD2Lister(group, generatorList);
    error "hallo";
    intEdgeList := integerListMaker(labelEdgeList);
    m:=Maximum(&join intEdgeList);
    return Graph<m|intEdgeList>;

end intrinsic;





//modd operator for correct index handling
intrinsic modd(index::RngIntElt, limit::RngIntElt) -> RngIntElt
    {TODO}
    if (index in [1 .. limit]) then 
        return index;
    else 
        return (index mod limit) ;
    end if;
end intrinsic;


//test function
intrinsic tester(group::GrpPerm, generatorList::SeqEnum) -> SeqEnum
    {TODO}

    graph := graphDMakerWithGenerators(group, generatorList);

    positions := [];
    wrongLabels := [];
    labels := [];

    for runner in Positions([Degree(v): v in Vertices(graph)], 2) do
        Append(~positions, runner);
    end for;


    labels := getLabels(graphD2Lister(group, generatorList));

    for runner in positions do

        Append(~wrongLabels, labels[runner]);

    end for;

    return wrongLabels;
end intrinsic;