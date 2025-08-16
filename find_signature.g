LoadPackage("digraphs");

Signature := function(gamma)
    #This function accepts a vertex-transitive graph gamma and returns its signature
    local distance, v, w, u, P, C, B , l, valence, i, finish,  P_, C_, B_, count, j, neighbours_of_1, tabela, p ;
    finish := 0;
    # we choose a beginning vertex
    v := 1;
    # C is the list of current vertices
    C := List(OutNeighboursOfVertex(gamma, 1));
    valence := Size(C);
    P := [];
    for i in [1..valence] do
        Append(P, [v]);
    od;
    # B is who the path belongs to
    B := C;
    while finish <> 1 do
        P_ := [];
        C_ := [];
        B_ := [];
        l := Size(C);
        for i in [1..l] do
            w := C[i];
            tabela := List(OutNeighboursOfVertex(gamma, w));
            p := Position(OutNeighboursOfVertex(gamma, w), P[i]);
            Remove(tabela, p);
            Append(C_, tabela);
            for u in tabela do
                if u = 1 then
                    finish := 1;
                fi;
            od;
            for j in [1..valence-1] do
                Append(P_, [C[i]]);
                Append(B_, [B[i]]);
            od;
        od;
        P := P_;
        C := C_;
        B := B_;
    od;
    # now we count how many times each vertex appears in the table
    count := [];
    for i in [1..valence] do
        Append(count, [0]);
    od;
    neighbours_of_1 := List(OutNeighboursOfVertex(gamma, 1));
    l := Size(B);
    for i in [1..l] do
        if C[i] = 1 then #beginning vertex
            for j in [1..valence] do
                if B[i] = neighbours_of_1[j] then
                    count[j] := count[j] + 1;
                fi;
            od;
        fi;   
    od;
    Sort(count);
    return count;
end;
