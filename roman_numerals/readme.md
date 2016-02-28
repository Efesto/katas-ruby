The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets)
The Kata says you should write a function to convert from normal numbers to Roman Numerals: eg

 1 --> I
 10 --> X
 7 --> VII

etc. For a full description of how it works, take a look at [http://www.novaroma.org/via_romana/numbers.html].

There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

For subtractive numerals the rule are:

I placed before V or X indicates one less, so four is IV (one less than five) and nine is IX (one less than ten)
X placed before L or C indicates ten less, so forty is XL (ten less than fifty) and ninety is XC (ten less than a hundred)
C placed before D or M indicates a hundred less, so four hundred is CD (a hundred less than five hundred) and nine hundred is CM (a hundred less than a thousand)    


Part II of the Kata

Write a function to convert in the other direction, ie numeral to digit
