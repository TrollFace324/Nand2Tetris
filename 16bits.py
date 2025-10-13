for i in range(15, 16, 1):
    print(f"""
// -------------- i-{i} --------------
Nand(a=in[{i}], b=curry{i-1}, out=N{i});

// sum (xor)
Nand(a=in[{i}], b=N{i}, out=C1{i});
Nand(a=curry{i-1}, b=N{i}, out=C2{i});
Nand(a=C1{i}, b=C2{i}, out=out[{i}]);

// carry (and)
Nand(a=N{i}, b=N{i}, out=carry{i});
    """)
