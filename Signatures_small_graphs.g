LoadPackage("digraphs");
LoadPackage("graphsym");
Read("find_signature.g");
output := OutputTextFile("small_signatures.txt", false);

# We look at the library of vertex-transitive graphs. If their girth is 7, we compute the signature.

j := 1;
for i in [1..1280] do
iter:=CubicVTGraphIterator(i,true);
stevilka_grafa := 1;
for gamma in iter do
    izpis := "";
    id_grafa := StringFormatted("{}", j);
    Append(id_grafa, "|");
    #Append(id_grafa, String(IdOfCubicVTGraph(gamma)));
    Append(id_grafa, String(stevilka_grafa));
    stevilka_grafa := stevilka_grafa + 1;
    #Does it have girth 7
    if DigraphUndirectedGirth(gamma) <> 7 then
        continue;
    fi; 
    s := Signature(gamma);
    izpis := Concatenation(izpis, String(id_grafa), " has signature: ", String(s), ", ");
    WriteLine(output, izpis);
od;
j := j+1;
od;
