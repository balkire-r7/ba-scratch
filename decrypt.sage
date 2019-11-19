nbits = 1024
e = 5
flag = open("flag.txt").read().strip()
assert len(flag) <= 64
m = Integer(int(flag.encode('hex'),16))
out = open("data.txt","w")

# Fermat's Little Theorem
for i in range(e):
    while True:
        p = random_prime(2^floor(nbits/2)-1, lbound=2^floor(nbits/2-1), proof=False)
        q = random_prime(2^floor(nbits/2)-1, lbound=2^floor(nbits/2-1), proof=False)
        ni = p*q
        phi = (p-1)*(q-1)
        if gcd(phi, e) == 1:
            break

    while True:
        ai = randint(1,ni-1)
        if gcd(ai, ni) == 1:
            break

    bi = randint(1,ni-1)
    mi = ai*m + bi
    ci = pow(mi, e, ni)
    out.write(str(ai)+'\n')
    out.write(str(bi)+'\n')
    out.write(str(ci)+'\n')
    out.write(str(ni)+'\n')

# m='\xa0\xce\x56\xf1\x91\xee\x4a\xdb\xb1\x03\xd0\x93\x22\x3e\x21\x8e'
# print "Message:  %s" % hex(m)[:].rstrip('L').decode("hex")
